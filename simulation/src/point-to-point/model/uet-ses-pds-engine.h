/**
 * uet-ses-pds-engine.h  —  UET SES/PDS Transaction Engine
 *
 * Central per-flow state machine integrating:
 *   - SES (Semantic layer): opcode/message/tag management
 *   - PDS (Packet Delivery): PDC selection, PSN assignment, ACK/NACK
 *   - PDC Manager: lifecycle, mapping, establishment
 *
 * Supports:
 *   RUD  - Reliable Unordered Delivery  (§3.5.3.3)
 *   ROD  - Reliable Ordered Delivery    (§3.5.3.4)
 *   RUDI - Reliable Unordered Datagram  (§3.5.3.5)
 *   UUD  - Unreliable Unordered Delivery(§3.5.3.6)
 */

#ifndef UET_SES_PDS_ENGINE_H
#define UET_SES_PDS_ENGINE_H

#include "uet-pdc.h"
#include "uet-pds-header.h"
#include "uet-ses-header.h"

#include "ns3/event-id.h"
#include "ns3/nstime.h"
#include "ns3/object.h"
#include "ns3/packet.h"

#include <cstdint>
#include <deque>
#include <functional>
#include <map>
#include <unordered_map>
#include <vector>

namespace ns3
{



// ─────────────────────────────────────────────────────────────────────────────
//  Per-message send state
// ─────────────────────────────────────────────────────────────────────────────
struct UetSendMessage
{
    uint16_t       message_id;           // SES message ID
    UetSesOpcode   opcode;               // SES operation
    uint8_t        tc;                   // Traffic class
    UetDeliveryMode mode;                // RUD/ROD/RUDI/UUD
    uint64_t       totalBytes;           // Total payload size
    uint64_t       sentBytes;            // Bytes enqueued so far
    uint16_t       ipdcid;              // PDC assigned to this message
    bool           complete;            // All packets sent
    bool           needsGuaranteedDel;  // SES response must be reliably stored

    // SES header template for this message
    UetSesHeader   sesHdr;
};

// ─────────────────────────────────────────────────────────────────────────────
//  Send-completion callback: called when PDS delivers ACK for all packets
//  args: (message_id, succeeded, returnCode)
// ─────────────────────────────────────────────────────────────────────────────
using UetTxCompletionCb = std::function<void(uint16_t, bool, uint8_t)>;

// ─────────────────────────────────────────────────────────────────────────────
//  Receive callback: called when new SES message arrival is complete
//  args: (packet with SES payload, UetSesHeader for this message)
// ─────────────────────────────────────────────────────────────────────────────
using UetRxMessageCb = std::function<void(Ptr<Packet>, const UetSesHeader&)>;

// ─────────────────────────────────────────────────────────────────────────────
//  Wire-send callback: engine calls this to inject a packet onto the wire
//  args: (fully built Packet with PDS+SES headers)
// ─────────────────────────────────────────────────────────────────────────────
using UetWireSendCb = std::function<void(Ptr<Packet>)>;

// ─────────────────────────────────────────────────────────────────────────────
//  Main engine
// ─────────────────────────────────────────────────────────────────────────────
class UetSesPdsEngine : public Object
{
  public:
    static TypeId GetTypeId();
    UetSesPdsEngine();
    ~UetSesPdsEngine() override;

    // ── Configuration ─────────────────────────────────────────────────────────
    void SetSrcFa(uint32_t ip)               { m_srcFa = ip; }
    void SetMsgMtu(uint32_t mtu)             { m_mtu = mtu; }
    void SetTxCompletionCb(UetTxCompletionCb cb) { m_txCb = cb; }
    void SetRxMessageCb(UetRxMessageCb cb)       { m_rxCb = cb; }
    void SetWireSendCb(UetWireSendCb cb)         { m_wireSendCb = cb; }
    void SetRtoInitUs(double us)             { m_rtoInitUs = us; }

    // ── TX interface ──────────────────────────────────────────────────────────
    // Enqueue a new RDMA message for transmission.
    // Returns message_id assigned, or 0 on failure.
    uint16_t Send(uint32_t dstFa, uint8_t tc, UetDeliveryMode mode,
                  UetSesOpcode opcode, uint64_t totalBytes,
                  uint64_t bufOffset, uint32_t jobId,
                  uint16_t srcPid, uint16_t  dstRi,
                  bool     needsGuaranteedDel = false);

    // Actually transmit next pending packet for a message (call after Send or ACK)
    void Pump();

    // ── RX interface ──────────────────────────────────────────────────────────
    // Called by the RDMA integration layer when a UET packet arrives.
    // Returns true if the packet was accepted, false if dropped.
    bool ProcessRxPacket(Ptr<Packet> pkt, uint32_t srcFaIP);

    // ── State inspection ──────────────────────────────────────────────────────
    uint32_t GetActivePdcCount() const       { return m_pdc.ActivePdcCount(); }
    std::string GetPdcStateReport()          { return m_pdc.DescribeAll(); }
    uint32_t GetTxPktCount() const           { return m_txPktCount; }
    uint32_t GetRxPktCount() const           { return m_rxPktCount; }
    uint32_t GetNackSentCount() const        { return m_nackSentCnt; }
    uint32_t GetNackRcvdCount() const        { return m_nackRcvdCnt; }
    uint32_t GetRetxCount() const            { return m_retxCnt; }

  private:
    uint32_t        m_srcFa;
    uint32_t        m_mtu;          // Max PDU payload bytes
    UetPdcManager   m_pdc;

    uint16_t        m_nextMsgId;
    double          m_rtoInitUs;

    // Inflight TX messages
    std::unordered_map<uint16_t, UetSendMessage> m_txMsgs;

    // RUDI packet ID counter (per-engine, must be locally unique but not monotonic)
    uint32_t m_nextRudiPktId;

    // Callbacks
    UetTxCompletionCb m_txCb;
    UetRxMessageCb    m_rxCb;
    UetWireSendCb     m_wireSendCb;

    // RX reassembly: {srcFa, messageId} → accumulated SES header
    struct RxMsg
    {
        UetSesHeader   sesHdr;
        uint64_t       receivedBytes;
        bool           started;
    };
    std::map<std::pair<uint32_t,uint16_t>, RxMsg> m_rxMsgs;

    // Counters
    uint32_t m_txPktCount;
    uint32_t m_rxPktCount;
    uint32_t m_nackSentCnt;
    uint32_t m_nackRcvdCnt;
    uint32_t m_retxCnt;

    // ── Private helpers ──────────────────────────────────────────────────────
    Ptr<Packet> BuildUdpPayloadPacket(UetSendMessage& msg, uint32_t chunkBytes,
                                       bool isSom, bool isEom);
    void SendNack(uint32_t dstFa, uint16_t spdcid, uint16_t dpdcid,
                  uint32_t nackPsn, uint8_t nackCode);
    void HandleRxNack(uint16_t ipdcid, const UetPdsHeader& nack);
    uint16_t AllocMsgId();
};

} // namespace ns3

#endif // UET_SES_PDS_ENGINE_H
