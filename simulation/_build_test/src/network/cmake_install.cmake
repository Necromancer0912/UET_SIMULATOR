# Install script for directory: /Users/sayan/Sayan/Study/Rinku_maam/NS3_UET/ns-3-alibabacloud/simulation/src/network

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/usr/local")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "release")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

# Set path to fallback-tool for dependency-resolution.
if(NOT DEFINED CMAKE_OBJDUMP)
  set(CMAKE_OBJDUMP "/usr/bin/objdump")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE SHARED_LIBRARY FILES "/Users/sayan/Sayan/Study/Rinku_maam/NS3_UET/ns-3-alibabacloud/simulation/build/lib/libns3.36.1-network-optimized.dylib")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libns3.36.1-network-optimized.dylib" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libns3.36.1-network-optimized.dylib")
    execute_process(COMMAND /usr/bin/install_name_tool
      -delete_rpath "/Users/sayan/Sayan/Study/Rinku_maam/NS3_UET/ns-3-alibabacloud/simulation/build/lib"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libns3.36.1-network-optimized.dylib")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/usr/bin/strip" -x "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libns3.36.1-network-optimized.dylib")
    endif()
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/ns3" TYPE FILE FILES
    "/Users/sayan/Sayan/Study/Rinku_maam/NS3_UET/ns-3-alibabacloud/simulation/src/network/helper/application-container.h"
    "/Users/sayan/Sayan/Study/Rinku_maam/NS3_UET/ns-3-alibabacloud/simulation/src/network/helper/delay-jitter-estimation.h"
    "/Users/sayan/Sayan/Study/Rinku_maam/NS3_UET/ns-3-alibabacloud/simulation/src/network/helper/net-device-container.h"
    "/Users/sayan/Sayan/Study/Rinku_maam/NS3_UET/ns-3-alibabacloud/simulation/src/network/helper/node-container.h"
    "/Users/sayan/Sayan/Study/Rinku_maam/NS3_UET/ns-3-alibabacloud/simulation/src/network/helper/packet-socket-helper.h"
    "/Users/sayan/Sayan/Study/Rinku_maam/NS3_UET/ns-3-alibabacloud/simulation/src/network/helper/simple-net-device-helper.h"
    "/Users/sayan/Sayan/Study/Rinku_maam/NS3_UET/ns-3-alibabacloud/simulation/src/network/helper/trace-helper.h"
    "/Users/sayan/Sayan/Study/Rinku_maam/NS3_UET/ns-3-alibabacloud/simulation/src/network/model/address.h"
    "/Users/sayan/Sayan/Study/Rinku_maam/NS3_UET/ns-3-alibabacloud/simulation/src/network/model/application.h"
    "/Users/sayan/Sayan/Study/Rinku_maam/NS3_UET/ns-3-alibabacloud/simulation/src/network/model/buffer.h"
    "/Users/sayan/Sayan/Study/Rinku_maam/NS3_UET/ns-3-alibabacloud/simulation/src/network/model/byte-tag-list.h"
    "/Users/sayan/Sayan/Study/Rinku_maam/NS3_UET/ns-3-alibabacloud/simulation/src/network/model/channel-list.h"
    "/Users/sayan/Sayan/Study/Rinku_maam/NS3_UET/ns-3-alibabacloud/simulation/src/network/model/channel.h"
    "/Users/sayan/Sayan/Study/Rinku_maam/NS3_UET/ns-3-alibabacloud/simulation/src/network/model/chunk.h"
    "/Users/sayan/Sayan/Study/Rinku_maam/NS3_UET/ns-3-alibabacloud/simulation/src/network/model/header.h"
    "/Users/sayan/Sayan/Study/Rinku_maam/NS3_UET/ns-3-alibabacloud/simulation/src/network/model/net-device.h"
    "/Users/sayan/Sayan/Study/Rinku_maam/NS3_UET/ns-3-alibabacloud/simulation/src/network/model/nix-vector.h"
    "/Users/sayan/Sayan/Study/Rinku_maam/NS3_UET/ns-3-alibabacloud/simulation/src/network/model/node-list.h"
    "/Users/sayan/Sayan/Study/Rinku_maam/NS3_UET/ns-3-alibabacloud/simulation/src/network/model/node.h"
    "/Users/sayan/Sayan/Study/Rinku_maam/NS3_UET/ns-3-alibabacloud/simulation/src/network/model/packet-metadata.h"
    "/Users/sayan/Sayan/Study/Rinku_maam/NS3_UET/ns-3-alibabacloud/simulation/src/network/model/packet-tag-list.h"
    "/Users/sayan/Sayan/Study/Rinku_maam/NS3_UET/ns-3-alibabacloud/simulation/src/network/model/packet.h"
    "/Users/sayan/Sayan/Study/Rinku_maam/NS3_UET/ns-3-alibabacloud/simulation/src/network/model/socket-factory.h"
    "/Users/sayan/Sayan/Study/Rinku_maam/NS3_UET/ns-3-alibabacloud/simulation/src/network/model/socket.h"
    "/Users/sayan/Sayan/Study/Rinku_maam/NS3_UET/ns-3-alibabacloud/simulation/src/network/model/tag-buffer.h"
    "/Users/sayan/Sayan/Study/Rinku_maam/NS3_UET/ns-3-alibabacloud/simulation/src/network/model/tag.h"
    "/Users/sayan/Sayan/Study/Rinku_maam/NS3_UET/ns-3-alibabacloud/simulation/src/network/model/trailer.h"
    "/Users/sayan/Sayan/Study/Rinku_maam/NS3_UET/ns-3-alibabacloud/simulation/src/network/utils/address-utils.h"
    "/Users/sayan/Sayan/Study/Rinku_maam/NS3_UET/ns-3-alibabacloud/simulation/src/network/utils/bit-deserializer.h"
    "/Users/sayan/Sayan/Study/Rinku_maam/NS3_UET/ns-3-alibabacloud/simulation/src/network/utils/bit-serializer.h"
    "/Users/sayan/Sayan/Study/Rinku_maam/NS3_UET/ns-3-alibabacloud/simulation/src/network/utils/crc32.h"
    "/Users/sayan/Sayan/Study/Rinku_maam/NS3_UET/ns-3-alibabacloud/simulation/src/network/utils/data-rate.h"
    "/Users/sayan/Sayan/Study/Rinku_maam/NS3_UET/ns-3-alibabacloud/simulation/src/network/utils/drop-tail-queue.h"
    "/Users/sayan/Sayan/Study/Rinku_maam/NS3_UET/ns-3-alibabacloud/simulation/src/network/utils/dynamic-queue-limits.h"
    "/Users/sayan/Sayan/Study/Rinku_maam/NS3_UET/ns-3-alibabacloud/simulation/src/network/utils/error-channel.h"
    "/Users/sayan/Sayan/Study/Rinku_maam/NS3_UET/ns-3-alibabacloud/simulation/src/network/utils/error-model.h"
    "/Users/sayan/Sayan/Study/Rinku_maam/NS3_UET/ns-3-alibabacloud/simulation/src/network/utils/ethernet-header.h"
    "/Users/sayan/Sayan/Study/Rinku_maam/NS3_UET/ns-3-alibabacloud/simulation/src/network/utils/ethernet-trailer.h"
    "/Users/sayan/Sayan/Study/Rinku_maam/NS3_UET/ns-3-alibabacloud/simulation/src/network/utils/flow-id-tag.h"
    "/Users/sayan/Sayan/Study/Rinku_maam/NS3_UET/ns-3-alibabacloud/simulation/src/network/utils/generic-phy.h"
    "/Users/sayan/Sayan/Study/Rinku_maam/NS3_UET/ns-3-alibabacloud/simulation/src/network/utils/inet-socket-address.h"
    "/Users/sayan/Sayan/Study/Rinku_maam/NS3_UET/ns-3-alibabacloud/simulation/src/network/utils/inet6-socket-address.h"
    "/Users/sayan/Sayan/Study/Rinku_maam/NS3_UET/ns-3-alibabacloud/simulation/src/network/utils/ipv4-address.h"
    "/Users/sayan/Sayan/Study/Rinku_maam/NS3_UET/ns-3-alibabacloud/simulation/src/network/utils/ipv6-address.h"
    "/Users/sayan/Sayan/Study/Rinku_maam/NS3_UET/ns-3-alibabacloud/simulation/src/network/utils/llc-snap-header.h"
    "/Users/sayan/Sayan/Study/Rinku_maam/NS3_UET/ns-3-alibabacloud/simulation/src/network/utils/lollipop-counter.h"
    "/Users/sayan/Sayan/Study/Rinku_maam/NS3_UET/ns-3-alibabacloud/simulation/src/network/utils/mac16-address.h"
    "/Users/sayan/Sayan/Study/Rinku_maam/NS3_UET/ns-3-alibabacloud/simulation/src/network/utils/mac48-address.h"
    "/Users/sayan/Sayan/Study/Rinku_maam/NS3_UET/ns-3-alibabacloud/simulation/src/network/utils/mac64-address.h"
    "/Users/sayan/Sayan/Study/Rinku_maam/NS3_UET/ns-3-alibabacloud/simulation/src/network/utils/mac8-address.h"
    "/Users/sayan/Sayan/Study/Rinku_maam/NS3_UET/ns-3-alibabacloud/simulation/src/network/utils/net-device-queue-interface.h"
    "/Users/sayan/Sayan/Study/Rinku_maam/NS3_UET/ns-3-alibabacloud/simulation/src/network/utils/output-stream-wrapper.h"
    "/Users/sayan/Sayan/Study/Rinku_maam/NS3_UET/ns-3-alibabacloud/simulation/src/network/utils/packet-burst.h"
    "/Users/sayan/Sayan/Study/Rinku_maam/NS3_UET/ns-3-alibabacloud/simulation/src/network/utils/packet-data-calculators.h"
    "/Users/sayan/Sayan/Study/Rinku_maam/NS3_UET/ns-3-alibabacloud/simulation/src/network/utils/packet-probe.h"
    "/Users/sayan/Sayan/Study/Rinku_maam/NS3_UET/ns-3-alibabacloud/simulation/src/network/utils/packet-socket-address.h"
    "/Users/sayan/Sayan/Study/Rinku_maam/NS3_UET/ns-3-alibabacloud/simulation/src/network/utils/packet-socket-client.h"
    "/Users/sayan/Sayan/Study/Rinku_maam/NS3_UET/ns-3-alibabacloud/simulation/src/network/utils/packet-socket-factory.h"
    "/Users/sayan/Sayan/Study/Rinku_maam/NS3_UET/ns-3-alibabacloud/simulation/src/network/utils/packet-socket-server.h"
    "/Users/sayan/Sayan/Study/Rinku_maam/NS3_UET/ns-3-alibabacloud/simulation/src/network/utils/packet-socket.h"
    "/Users/sayan/Sayan/Study/Rinku_maam/NS3_UET/ns-3-alibabacloud/simulation/src/network/utils/packetbb.h"
    "/Users/sayan/Sayan/Study/Rinku_maam/NS3_UET/ns-3-alibabacloud/simulation/src/network/utils/pcap-file-wrapper.h"
    "/Users/sayan/Sayan/Study/Rinku_maam/NS3_UET/ns-3-alibabacloud/simulation/src/network/utils/pcap-file.h"
    "/Users/sayan/Sayan/Study/Rinku_maam/NS3_UET/ns-3-alibabacloud/simulation/src/network/utils/pcap-test.h"
    "/Users/sayan/Sayan/Study/Rinku_maam/NS3_UET/ns-3-alibabacloud/simulation/src/network/utils/queue-item.h"
    "/Users/sayan/Sayan/Study/Rinku_maam/NS3_UET/ns-3-alibabacloud/simulation/src/network/utils/queue-limits.h"
    "/Users/sayan/Sayan/Study/Rinku_maam/NS3_UET/ns-3-alibabacloud/simulation/src/network/utils/queue-size.h"
    "/Users/sayan/Sayan/Study/Rinku_maam/NS3_UET/ns-3-alibabacloud/simulation/src/network/utils/queue.h"
    "/Users/sayan/Sayan/Study/Rinku_maam/NS3_UET/ns-3-alibabacloud/simulation/src/network/utils/packet-queue.h"
    "/Users/sayan/Sayan/Study/Rinku_maam/NS3_UET/ns-3-alibabacloud/simulation/src/network/utils/radiotap-header.h"
    "/Users/sayan/Sayan/Study/Rinku_maam/NS3_UET/ns-3-alibabacloud/simulation/src/network/utils/sequence-number.h"
    "/Users/sayan/Sayan/Study/Rinku_maam/NS3_UET/ns-3-alibabacloud/simulation/src/network/utils/simple-channel.h"
    "/Users/sayan/Sayan/Study/Rinku_maam/NS3_UET/ns-3-alibabacloud/simulation/src/network/utils/simple-net-device.h"
    "/Users/sayan/Sayan/Study/Rinku_maam/NS3_UET/ns-3-alibabacloud/simulation/src/network/utils/simple-drop-tail-queue.h"
    "/Users/sayan/Sayan/Study/Rinku_maam/NS3_UET/ns-3-alibabacloud/simulation/src/network/utils/sll-header.h"
    "/Users/sayan/Sayan/Study/Rinku_maam/NS3_UET/ns-3-alibabacloud/simulation/src/network/utils/broadcom-egress-queue.h"
    "/Users/sayan/Sayan/Study/Rinku_maam/NS3_UET/ns-3-alibabacloud/simulation/src/network/utils/custom-header.h"
    "/Users/sayan/Sayan/Study/Rinku_maam/NS3_UET/ns-3-alibabacloud/simulation/src/network/utils/int-header.h"
    "/Users/sayan/Sayan/Study/Rinku_maam/NS3_UET/ns-3-alibabacloud/simulation/src/network/utils/red-queue.h"
    "/Users/sayan/Sayan/Study/Rinku_maam/NS3_UET/ns-3-alibabacloud/simulation/build/include/ns3/network-module.h"
    )
endif()

string(REPLACE ";" "\n" CMAKE_INSTALL_MANIFEST_CONTENT
       "${CMAKE_INSTALL_MANIFEST_FILES}")
if(CMAKE_INSTALL_LOCAL_ONLY)
  file(WRITE "/Users/sayan/Sayan/Study/Rinku_maam/NS3_UET/ns-3-alibabacloud/simulation/_build_test/src/network/install_local_manifest.txt"
     "${CMAKE_INSTALL_MANIFEST_CONTENT}")
endif()
