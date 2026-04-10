/**
 * uet-ses-pds-engine.cc  —  UET SES/PDS Transaction Engine implementation
 *
 * References: UE-Specification-1.0.2 §3.4, §3.5
 */

#include "uet-ses-pds-engine.h"

#include "ns3/log.h"
#include "ns3/simulator.h"

#include <iomanip>
#include <sstream>

namespace ns3
{

NS_LOG_COMPONENT_DEFINE("UetSesPdsEngine");
NS_OBJECT_ENSURE_REGISTERED(UetSesPdsEngine);

TypeId
UetSesPdsEngine::GetTypeId()
{
    static TypeId tid = TypeId("ns3::UetSesPdsEngine")
                            .SetParent<Object>()
                            .AddConstructor<UetSesPdsEngine>();
    return tid;
}

UetSesPdsEngine::UetSesPdsEngine()
    : m_srcFa(0), m_mtu(4096), m_pdc(256),
      m_nextMsgId(1), m_rtoInitUs(30.0),
      m_nextRudiPktId(1),
      m_txPktCount(0), m_rxPktCount(0),
      m_nackSentCnt(0), m_nackRcvdCnt(0), m_retxCnt(0)
{
}

UetSesPdsEngine::~UetSesPdsEngine() = default;

// ─────────────────────────────────────────────────────────────────────────────
//  AllocMsgId
// ─────────────────────────────────────────────────────────────────────────────
uint16_t
UetSesPdsEngine::AllocMsgId()
{
    uint16_t id = m_nextMsgId;
    while (id == 0 || m_txMsgs.count(id))
    {
        ++id;
        if (id == 0) id = 1;
    }
    m_nextMsgId = id + 1;
    if (m_nextMsgId == 0) m_nextMsgId = 1;
    return id;
}

// ═════════════════════════════════════════════════════════════════════════════
//  Send  —  enqueue a new RDMA message
// ═════════════════════════════════════════════════════════════════════════════
uint16_t
UetSesPdsEngine::Send(uint32_t dstFa,  uint8_t tc,  UetDeliveryMode mode,
                       UetSesOpcode opcode, uint64_t totalBytes,
                       uint64_t bufOffset, uint32_t jobId,
                       uint16_t srcPid, uint16_t dstRi,
                       bool needsGuaranteedDel)
{
    NS_LOG_FUNCTION(this << dstFa << (int)mode << totalBytes);

    if (mode == UET_MODE_UUD || mode == UET_MODE_RUDI)
    {
        // RUDI and UUD: single-packet, no PDC needed for RUDI
        // (RUDI uses PDC for reliability per §3.5.3.5 but without ordering)
    }

    // ── 1. Select or create a PDC ─────────────────────────────────────────────
    bool isRod = (mode == UET_MODE_ROD);
    PdcTuple tuple;
    tuple.srcFa  = m_srcFa;
    tuple.dstFa  = dstFa;
    tuple.tc     = tc;
    tuple.mode   = isRod ? PDS_TYPE_ROD_REQ : PDS_TYPE_RUD_REQ;
    tuple.jobId  = jobId;
    tuple.srcPid = srcPid;
    tuple.dstPid = dstRi;

    uint16_t ipdcid = 0;
    if (mode != UET_MODE_UUD)
    {
        ipdcid = m_pdc.FindExistingPdc(tuple);
        if (ipdcid == 0)
        {
            ipdcid = m_pdc.AllocInitiatorPdc(tuple, m_srcFa, dstFa, isRod, tc);
            if (ipdcid == 0)
            {
                NS_LOG_WARN("UetSesPdsEngine: cannot allocate PDC for dstFa=0x"
                            << std::hex << dstFa << std::dec);
                return 0;
            }
            NS_LOG_INFO("UetSesPdsEngine: new PDC IPDCID=" << ipdcid << " for dstFa=0x"
                        << std::hex << dstFa << std::dec);
        }
        m_pdc.MapMsg(0 /*msgId allocated next*/, ipdcid);
    }

    // ── 2. Build message state ─────────────────────────────────────────────────
    uint16_t msgId = AllocMsgId();
    if (ipdcid != 0)
        m_pdc.MapMsg(msgId, ipdcid);

    UetSendMessage& msg = m_txMsgs[msgId];
    msg.message_id        = msgId;
    msg.opcode            = opcode;
    msg.tc                = tc;
    msg.mode              = mode;
    msg.totalBytes        = totalBytes;
    msg.sentBytes         = 0;
    msg.ipdcid            = ipdcid;
    msg.complete          = false;
    msg.needsGuaranteedDel = needsGuaranteedDel;

    bool multiPkt = (totalBytes > m_mtu);
    bool needsMatchBits = (opcode == UET_TAGGED_SEND || opcode == UET_RENDEZVOUS_TSEND);

    // Build the SES header template  (actual packet headers filled in per-chunk)
    UetSesNextHdr fmt = UetSesHeader::ChooseRequestFormat(opcode, multiPkt, needsMatchBits);
    msg.sesHdr.SetFormat(fmt);
    msg.sesHdr.opcode          = (uint8_t)opcode;
    msg.sesHdr.version         = 0;
    msg.sesHdr.dc              = false;
    msg.sesHdr.ie              = false;
    msg.sesHdr.rel             = true;
    msg.sesHdr.hd              = false;
    msg.sesHdr.message_id      = msgId;
    msg.sesHdr.ri_generation   = 0;
    msg.sesHdr.jobId           = jobId;
    msg.sesHdr.pidOnFep        = srcPid;
    msg.sesHdr.resource_index  = dstRi;
    msg.sesHdr.buffer_offset   = bufOffset;
    msg.sesHdr.request_length  = (uint32_t)totalBytes;
    msg.sesHdr.header_data     = 0;
    msg.sesHdr.match_bits      = 0;
    msg.sesHdr.hasAtomic       = false;

    NS_LOG_INFO("UetSesPdsEngine: enqueued msgId=" << msgId
                << " opcode=0x" << std::hex << (int)opcode << std::dec
                << " totalBytes=" << totalBytes
                << " ipdcid=" << ipdcid
                << " mode=" << (int)mode);

    Pump();
    return msgId;
}

// ═════════════════════════════════════════════════════════════════════════════
//  Pump  —  transmit next chunk for pending messages
// ═════════════════════════════════════════════════════════════════════════════
void
UetSesPdsEngine::Pump()
{
    for (auto& kv : m_txMsgs)
    {
        UetSendMessage& msg = kv.second;
        if (msg.complete) continue;

        uint64_t remaining = msg.totalBytes - msg.sentBytes;
        if (remaining == 0) { msg.complete = true; continue; }

        // Check PDC window (skip if full)
        if (msg.mode != UET_MODE_UUD)
        {
            PdcContext* ctx = m_pdc.GetByIpdcid(msg.ipdcid);
            if (ctx && ctx->fwd.IsWindowFull())
                continue;
        }

        // Slice into at most MTU-sized PDS payload
        uint32_t chunk = (uint32_t)std::min<uint64_t>(remaining, m_mtu);
        bool isSom = (msg.sentBytes == 0);
        bool isEom = (msg.sentBytes + chunk >= msg.totalBytes);

        // Update SES flags
        msg.sesHdr.som         = isSom;
        msg.sesHdr.eom         = isEom;
        msg.sesHdr.message_offset = (uint32_t)msg.sentBytes;
        msg.sesHdr.payload_length = (uint16_t)chunk;
        if (!isSom && msg.sesHdr.GetFormat() == UET_HDR_REQUEST_STD)
        {
            // SOM=0: switch serialization path
            // (no format change needed; som/eom flags control path in Serialize)
        }

        Ptr<Packet> out = BuildUdpPayloadPacket(msg, chunk, isSom, isEom);
        if (!out) continue;

        msg.sentBytes += chunk;
        if (isEom) msg.complete = true;

        ++m_txPktCount;
        if (m_wireSendCb) m_wireSendCb(out);
    }
}

// ─────────────────────────────────────────────────────────────────────────────
//  BuildUdpPayloadPacket  —  construct complete PDS+SES packet
// ─────────────────────────────────────────────────────────────────────────────
Ptr<Packet>
UetSesPdsEngine::BuildUdpPayloadPacket(UetSendMessage& msg, uint32_t chunkBytes,
                                        bool isSom, bool isEom)
{
    UetSesNextHdr sesNextHdr = msg.sesHdr.GetFormat();

    if (msg.mode == UET_MODE_UUD)
    {
        // UUD: no PDC, minimal PDS header
        UetPdsHeader pds;
        pds.prologue.pdsType = PDS_TYPE_UUD_REQ;
        pds.prologue.nextHdr = sesNextHdr;
        pds.prologue.flags   = UetPdsFlags{};
        pds.spdcid           = 0;
        pds.dpdcid           = 0;


        Ptr<Packet> p = Create<Packet>(chunkBytes);
        p->AddHeader(msg.sesHdr);
        p->AddHeader(pds);
        return p;
    }

    if (msg.mode == UET_MODE_RUDI)
    {
        UetPdsHeader pds;
        pds.prologue.pdsType = PDS_TYPE_RUDI_REQ;
        pds.prologue.nextHdr = sesNextHdr;
        pds.prologue.flags   = UetPdsFlags{};
        pds.pkt_id           = m_nextRudiPktId++;
        pds.spdcid           = 0;
        pds.dpdcid           = 0;

        Ptr<Packet> p = Create<Packet>(chunkBytes);
        p->AddHeader(msg.sesHdr);
        p->AddHeader(pds);
        return p;
    }

    // RUD / ROD: build PDS request header with PSN
    UetPdsHeader pds;
    bool ok = m_pdc.BuildTxReqHeader(msg.ipdcid,
                                      (uint8_t)sesNextHdr,
                                      chunkBytes,
                                      isSom, isEom,
                                      msg.needsGuaranteedDel,
                                      pds);
    if (!ok) return nullptr;

    Ptr<Packet> p = Create<Packet>(chunkBytes);
    p->AddHeader(msg.sesHdr);
    p->AddHeader(pds);
    return p;
}

// ═════════════════════════════════════════════════════════════════════════════
//  ProcessRxPacket  —  RX dispatch from RDMA integration layer
// ═════════════════════════════════════════════════════════════════════════════
bool
UetSesPdsEngine::ProcessRxPacket(Ptr<Packet> pkt, uint32_t srcFaIP)
{
    NS_LOG_FUNCTION(this << srcFaIP);

    // ── 1. Parse PDS header ───────────────────────────────────────────────────
    UetPdsHeader pds;
    if (pkt->GetSize() < pds.GetSerializedSize())
    {
        NS_LOG_WARN("RxPacket: too short for PDS header");
        return false;
    }
    pkt->RemoveHeader(pds);

    ++m_rxPktCount;

    // ── 2. Dispatch by PDS type ───────────────────────────────────────────────
    if (pds.IsAck())
    {
        // Initiator RX path (Fig 3-48)
        uint16_t ipdcid = m_pdc.GetMsgPdc(0); // Lookup by DPDCID
        // Map using dpdcid (which is our IPDCID echoed back by target)
        //  find context directly via dpdcid as IPDCID
        PdcContext* ctx = m_pdc.GetByIpdcid(pds.dpdcid);
        if (!ctx)
        {
            NS_LOG_WARN("RxAck: unknown IPDCID=" << pds.dpdcid);
            return false;
        }
        ipdcid = ctx->ipdcid;
        std::vector<uint32_t> retxPsns;
        m_pdc.ProcessRxAck(ipdcid, pds);

        // Fire completion for any messages whose outstanding PSNs now all cleared
        for (auto& kv : m_txMsgs)
        {
            UetSendMessage& msg = kv.second;
            if (!msg.complete || msg.ipdcid != ipdcid) continue;
            auto pdcCtx = m_pdc.GetByIpdcid(ipdcid);
            if (pdcCtx && pdcCtx->fwd.outstanding.empty())
            {
                if (m_txCb) m_txCb(msg.message_id, true, RC_OK);
            }
        }
        return true;
    }

    if (pds.IsNack())
    {
        ++m_nackRcvdCnt;
        uint16_t ipdcid = pds.dpdcid; // Our IPDCID echoed in NACK as dpdcid
        HandleRxNack(ipdcid, pds);
        return true;
    }

    if (pds.IsCP())
    {
        uint16_t ipdcid = pds.dpdcid;
        m_pdc.ProcessRxCP(ipdcid, pds);
        return true;
    }

    if (pds.IsRequest())
    {
        // Target RX path (Fig 3-49)
        uint32_t clearPsn;
        bool     isNew, isDup;
        bool isTrimmed = false; // future: check for trimmed indication in IP flags
        uint8_t nackCode = m_pdc.ProcessRxRequest(pds, srcFaIP, isTrimmed,
                                                    clearPsn, isNew, isDup);

        if (nackCode != 0)
        {
            // Generate NACK (§3.5.12.7)
            SendNack(srcFaIP, pds.dpdcid, pds.spdcid,
                     pds.psn, nackCode);
            ++m_nackSentCnt;
            return false;
        }

        if (isDup)
        {
            NS_LOG_LOGIC("RxRequest: duplicate psn=" << pds.psn << " from srcFa=0x"
                         << std::hex << srcFaIP << std::dec << " — dropped");
            // Still send ACK for duplicates per spec
        }

        // Parse SES header (if present)
        bool hasSes = (pds.prologue.nextHdr != UET_HDR_NONE);
        UetSesHeader ses;
        if (hasSes && pkt->GetSize() >= UetSesHeader::FormatSize(
                          (UetSesNextHdr)pds.prologue.nextHdr, true))
        {
            ses.SetFormat((UetSesNextHdr)pds.prologue.nextHdr);
            ses.som = true; // set to allow right parse; actual bit read in Deserialize
            pkt->RemoveHeader(ses);
        }

        // Notify application layer
        if (hasSes && isNew && m_rxCb)
            m_rxCb(pkt, ses);

        // Build and send ACK
        bool needsSack = (!pds.prologue.flags.retx); // always try SACK first
        UetPdsHeader ack;
        if (m_pdc.BuildAckHeader(srcFaIP, pds.spdcid, pds.psn, needsSack, ack))
        {
            Ptr<Packet> ackPkt = Create<Packet>(0);
            ackPkt->AddHeader(ack);
            if (m_wireSendCb) m_wireSendCb(ackPkt);
        }
        return true;
    }

    if (pds.IsRudi())
    {
        // RUDI: pass directly to SES (no PSN state needed)
        if (pkt->GetSize() > 0)
        {
            UetSesHeader ses;
            bool hasSes = (pds.prologue.nextHdr != UET_HDR_NONE);
            if (hasSes) pkt->RemoveHeader(ses);
            if (m_rxCb) m_rxCb(pkt, ses);
        }
        return true;
    }

    if (pds.IsUud())
    {
        // UUD: unreliable — pass directly to SES
        if (pkt->GetSize() > 0)
        {
            UetSesHeader ses;
            bool hasSes = (pds.prologue.nextHdr != UET_HDR_NONE);
            if (hasSes) pkt->RemoveHeader(ses);
            if (m_rxCb) m_rxCb(pkt, ses);
        }
        return true;
    }

    NS_LOG_WARN("RxPacket: unrecognized PDS type=" << (int)pds.prologue.pdsType);
    return false;
}

// ─────────────────────────────────────────────────────────────────────────────
//  SendNack
// ─────────────────────────────────────────────────────────────────────────────
void
UetSesPdsEngine::SendNack(uint32_t dstFa, uint16_t spdcid, uint16_t dpdcid,
                           uint32_t nackPsn, uint8_t nackCode)
{
    UetPdsHeader nack;
    m_pdc.BuildNackHeader(dstFa, spdcid, dpdcid, nackPsn, nackCode, nack);
    Ptr<Packet> pkt = Create<Packet>(0);
    pkt->AddHeader(nack);
    if (m_wireSendCb) m_wireSendCb(pkt);
    NS_LOG_INFO("UetEngine: Sent NACK code=" << UetPdsHeader::NackCodeName(nackCode)
                << " psn=" << nackPsn);
}

// ─────────────────────────────────────────────────────────────────────────────
//  HandleRxNack  (initiator processing per §3.5.12.7 error model)
// ─────────────────────────────────────────────────────────────────────────────
void
UetSesPdsEngine::HandleRxNack(uint16_t ipdcid, const UetPdsHeader& nack)
{
    NS_LOG_INFO("UetEngine: RX NACK ipdcid=" << ipdcid
                << " code=" << UetPdsHeader::NackCodeName(nack.nack_code)
                << "(0x" << std::hex << (int)nack.nack_code << std::dec << ")"
                << " nack_psn=" << nack.nack_psn);

    PdcContext* ctx = m_pdc.GetByIpdcid(ipdcid);

    switch (nack.nack_code)
    {
    case NACK_TRIMMED:
    case NACK_TRIMMED_LASTHOP:
    case NACK_NO_PKT_BUFFER:
    case NACK_NO_GTD_DEL_AVAIL:
    case NACK_NO_SES_MSG_AVAIL:
    case NACK_NO_RESOURCE:
    case NACK_PSN_OOR_WINDOW:
    case NACK_ROD_OOO:
        // NORMAL/RETX — retransmit same PSN on same PDC
        ++m_retxCnt;
        if (ctx)
        {
            auto& outstanding = ctx->fwd.outstanding;
            auto it = outstanding.find(nack.nack_psn);
            if (it != outstanding.end())
            {
                it->second.nack_retry_cnt++;
                it->second.retry_cnt = 0; // reset RTO counter per spec
            }
        }
        NS_LOG_INFO("  → RETX on same PDC");
        break;

    case NACK_NO_PDC_AVAIL:
    case NACK_NO_CCC_AVAIL:
    case NACK_NO_BITMAP:
        // NORMAL/RETRY — create new PDC and retransmit
        NS_LOG_INFO("  → RETRY with new PDC");
        break;

    case NACK_INV_DPDCID:
    case NACK_PDC_HDR_MISMATCH:
    case NACK_CLOSING:
    case NACK_PDC_MODE_MISMATCH:
        // PDC_FATAL — close PDC
        NS_LOG_WARN("  → PDC_FATAL: closing PDC " << ipdcid);
        if (ctx) m_pdc.InitiateClose(ipdcid);
        break;

    case NACK_INVALID_SYN:
        // PDC_ERR — PDC remains active
        NS_LOG_INFO("  → PDC_ERR: invalid SYN, continuing");
        break;

    case NACK_NEW_START_PSN:
        // Encrypted: target gives us new Start_PSN in nack.nack_payload
        NS_LOG_INFO("  → NEW_START_PSN=0x" << std::hex << nack.nack_payload << std::dec);
        break;

    default:
        NS_LOG_WARN("  → Unknown NACK code=0x" << std::hex << (int)nack.nack_code);
        break;
    }
}

} // namespace ns3
