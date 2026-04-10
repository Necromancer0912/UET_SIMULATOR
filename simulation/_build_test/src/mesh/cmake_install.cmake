# Install script for directory: /Users/sayan/Sayan/Study/Rinku_maam/NS3_UET/ns-3-alibabacloud/simulation/src/mesh

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
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE SHARED_LIBRARY FILES "/Users/sayan/Sayan/Study/Rinku_maam/NS3_UET/ns-3-alibabacloud/simulation/build/lib/libns3.36.1-mesh-optimized.dylib")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libns3.36.1-mesh-optimized.dylib" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libns3.36.1-mesh-optimized.dylib")
    execute_process(COMMAND /usr/bin/install_name_tool
      -delete_rpath "/Users/sayan/Sayan/Study/Rinku_maam/NS3_UET/ns-3-alibabacloud/simulation/build/lib"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libns3.36.1-mesh-optimized.dylib")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/usr/bin/strip" -x "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libns3.36.1-mesh-optimized.dylib")
    endif()
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/ns3" TYPE FILE FILES
    "/Users/sayan/Sayan/Study/Rinku_maam/NS3_UET/ns-3-alibabacloud/simulation/src/mesh/helper/dot11s/dot11s-installer.h"
    "/Users/sayan/Sayan/Study/Rinku_maam/NS3_UET/ns-3-alibabacloud/simulation/src/mesh/helper/flame/flame-installer.h"
    "/Users/sayan/Sayan/Study/Rinku_maam/NS3_UET/ns-3-alibabacloud/simulation/src/mesh/helper/mesh-helper.h"
    "/Users/sayan/Sayan/Study/Rinku_maam/NS3_UET/ns-3-alibabacloud/simulation/src/mesh/helper/mesh-stack-installer.h"
    "/Users/sayan/Sayan/Study/Rinku_maam/NS3_UET/ns-3-alibabacloud/simulation/src/mesh/model/dot11s/dot11s-mac-header.h"
    "/Users/sayan/Sayan/Study/Rinku_maam/NS3_UET/ns-3-alibabacloud/simulation/src/mesh/model/dot11s/hwmp-protocol.h"
    "/Users/sayan/Sayan/Study/Rinku_maam/NS3_UET/ns-3-alibabacloud/simulation/src/mesh/model/dot11s/hwmp-rtable.h"
    "/Users/sayan/Sayan/Study/Rinku_maam/NS3_UET/ns-3-alibabacloud/simulation/src/mesh/model/dot11s/ie-dot11s-beacon-timing.h"
    "/Users/sayan/Sayan/Study/Rinku_maam/NS3_UET/ns-3-alibabacloud/simulation/src/mesh/model/dot11s/ie-dot11s-configuration.h"
    "/Users/sayan/Sayan/Study/Rinku_maam/NS3_UET/ns-3-alibabacloud/simulation/src/mesh/model/dot11s/ie-dot11s-id.h"
    "/Users/sayan/Sayan/Study/Rinku_maam/NS3_UET/ns-3-alibabacloud/simulation/src/mesh/model/dot11s/ie-dot11s-metric-report.h"
    "/Users/sayan/Sayan/Study/Rinku_maam/NS3_UET/ns-3-alibabacloud/simulation/src/mesh/model/dot11s/ie-dot11s-peer-management.h"
    "/Users/sayan/Sayan/Study/Rinku_maam/NS3_UET/ns-3-alibabacloud/simulation/src/mesh/model/dot11s/ie-dot11s-peering-protocol.h"
    "/Users/sayan/Sayan/Study/Rinku_maam/NS3_UET/ns-3-alibabacloud/simulation/src/mesh/model/dot11s/ie-dot11s-perr.h"
    "/Users/sayan/Sayan/Study/Rinku_maam/NS3_UET/ns-3-alibabacloud/simulation/src/mesh/model/dot11s/ie-dot11s-prep.h"
    "/Users/sayan/Sayan/Study/Rinku_maam/NS3_UET/ns-3-alibabacloud/simulation/src/mesh/model/dot11s/ie-dot11s-preq.h"
    "/Users/sayan/Sayan/Study/Rinku_maam/NS3_UET/ns-3-alibabacloud/simulation/src/mesh/model/dot11s/ie-dot11s-rann.h"
    "/Users/sayan/Sayan/Study/Rinku_maam/NS3_UET/ns-3-alibabacloud/simulation/src/mesh/model/dot11s/peer-link-frame.h"
    "/Users/sayan/Sayan/Study/Rinku_maam/NS3_UET/ns-3-alibabacloud/simulation/src/mesh/model/dot11s/peer-link.h"
    "/Users/sayan/Sayan/Study/Rinku_maam/NS3_UET/ns-3-alibabacloud/simulation/src/mesh/model/dot11s/peer-management-protocol.h"
    "/Users/sayan/Sayan/Study/Rinku_maam/NS3_UET/ns-3-alibabacloud/simulation/src/mesh/model/flame/flame-header.h"
    "/Users/sayan/Sayan/Study/Rinku_maam/NS3_UET/ns-3-alibabacloud/simulation/src/mesh/model/flame/flame-protocol-mac.h"
    "/Users/sayan/Sayan/Study/Rinku_maam/NS3_UET/ns-3-alibabacloud/simulation/src/mesh/model/flame/flame-protocol.h"
    "/Users/sayan/Sayan/Study/Rinku_maam/NS3_UET/ns-3-alibabacloud/simulation/src/mesh/model/flame/flame-rtable.h"
    "/Users/sayan/Sayan/Study/Rinku_maam/NS3_UET/ns-3-alibabacloud/simulation/src/mesh/model/mesh-information-element-vector.h"
    "/Users/sayan/Sayan/Study/Rinku_maam/NS3_UET/ns-3-alibabacloud/simulation/src/mesh/model/mesh-l2-routing-protocol.h"
    "/Users/sayan/Sayan/Study/Rinku_maam/NS3_UET/ns-3-alibabacloud/simulation/src/mesh/model/mesh-point-device.h"
    "/Users/sayan/Sayan/Study/Rinku_maam/NS3_UET/ns-3-alibabacloud/simulation/src/mesh/model/mesh-wifi-beacon.h"
    "/Users/sayan/Sayan/Study/Rinku_maam/NS3_UET/ns-3-alibabacloud/simulation/src/mesh/model/mesh-wifi-interface-mac-plugin.h"
    "/Users/sayan/Sayan/Study/Rinku_maam/NS3_UET/ns-3-alibabacloud/simulation/src/mesh/model/mesh-wifi-interface-mac.h"
    "/Users/sayan/Sayan/Study/Rinku_maam/NS3_UET/ns-3-alibabacloud/simulation/build/include/ns3/mesh-module.h"
    )
endif()

string(REPLACE ";" "\n" CMAKE_INSTALL_MANIFEST_CONTENT
       "${CMAKE_INSTALL_MANIFEST_FILES}")
if(CMAKE_INSTALL_LOCAL_ONLY)
  file(WRITE "/Users/sayan/Sayan/Study/Rinku_maam/NS3_UET/ns-3-alibabacloud/simulation/_build_test/src/mesh/install_local_manifest.txt"
     "${CMAKE_INSTALL_MANIFEST_CONTENT}")
endif()
