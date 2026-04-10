# Install script for directory: /Users/sayan/Sayan/Study/Rinku_maam/NS3_UET/ns-3-alibabacloud/simulation/src/point-to-point

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
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE SHARED_LIBRARY FILES "/Users/sayan/Sayan/Study/Rinku_maam/NS3_UET/ns-3-alibabacloud/simulation/build/lib/libns3.36.1-point-to-point-optimized.dylib")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libns3.36.1-point-to-point-optimized.dylib" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libns3.36.1-point-to-point-optimized.dylib")
    execute_process(COMMAND /usr/bin/install_name_tool
      -delete_rpath "/Users/sayan/Sayan/Study/Rinku_maam/NS3_UET/ns-3-alibabacloud/simulation/build/lib"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libns3.36.1-point-to-point-optimized.dylib")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/usr/bin/strip" -x "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libns3.36.1-point-to-point-optimized.dylib")
    endif()
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/ns3" TYPE FILE FILES
    "/Users/sayan/Sayan/Study/Rinku_maam/NS3_UET/ns-3-alibabacloud/simulation/src/point-to-point/helper/point-to-point-helper.h"
    "/Users/sayan/Sayan/Study/Rinku_maam/NS3_UET/ns-3-alibabacloud/simulation/src/point-to-point/helper/qbb-helper.h"
    "/Users/sayan/Sayan/Study/Rinku_maam/NS3_UET/ns-3-alibabacloud/simulation/src/point-to-point/helper/sim-setting.h"
    "/Users/sayan/Sayan/Study/Rinku_maam/NS3_UET/ns-3-alibabacloud/simulation/src/point-to-point/model/point-to-point-channel.h"
    "/Users/sayan/Sayan/Study/Rinku_maam/NS3_UET/ns-3-alibabacloud/simulation/src/point-to-point/model/point-to-point-net-device.h"
    "/Users/sayan/Sayan/Study/Rinku_maam/NS3_UET/ns-3-alibabacloud/simulation/src/point-to-point/model/ppp-header.h"
    "/Users/sayan/Sayan/Study/Rinku_maam/NS3_UET/ns-3-alibabacloud/simulation/src/point-to-point/model/qbb-net-device.h"
    "/Users/sayan/Sayan/Study/Rinku_maam/NS3_UET/ns-3-alibabacloud/simulation/src/point-to-point/model/pause-header.h"
    "/Users/sayan/Sayan/Study/Rinku_maam/NS3_UET/ns-3-alibabacloud/simulation/src/point-to-point/model/cn-header.h"
    "/Users/sayan/Sayan/Study/Rinku_maam/NS3_UET/ns-3-alibabacloud/simulation/src/point-to-point/model/pint.h"
    "/Users/sayan/Sayan/Study/Rinku_maam/NS3_UET/ns-3-alibabacloud/simulation/src/point-to-point/model/qbb-header.h"
    "/Users/sayan/Sayan/Study/Rinku_maam/NS3_UET/ns-3-alibabacloud/simulation/src/point-to-point/model/rdma-seq-ts-header.h"
    "/Users/sayan/Sayan/Study/Rinku_maam/NS3_UET/ns-3-alibabacloud/simulation/src/point-to-point/model/uet-ses-header.h"
    "/Users/sayan/Sayan/Study/Rinku_maam/NS3_UET/ns-3-alibabacloud/simulation/src/point-to-point/model/uet-pds-control-packet.h"
    "/Users/sayan/Sayan/Study/Rinku_maam/NS3_UET/ns-3-alibabacloud/simulation/src/point-to-point/model/uet-pds-target-state.h"
    "/Users/sayan/Sayan/Study/Rinku_maam/NS3_UET/ns-3-alibabacloud/simulation/src/point-to-point/model/uet-pds-header.h"
    "/Users/sayan/Sayan/Study/Rinku_maam/NS3_UET/ns-3-alibabacloud/simulation/src/point-to-point/model/uet-pdc.h"
    "/Users/sayan/Sayan/Study/Rinku_maam/NS3_UET/ns-3-alibabacloud/simulation/src/point-to-point/model/uet-ses-pds-engine.h"
    "/Users/sayan/Sayan/Study/Rinku_maam/NS3_UET/ns-3-alibabacloud/simulation/src/point-to-point/model/rdma-hw-uet-integration.h"
    "/Users/sayan/Sayan/Study/Rinku_maam/NS3_UET/ns-3-alibabacloud/simulation/src/point-to-point/model/qbb-channel.h"
    "/Users/sayan/Sayan/Study/Rinku_maam/NS3_UET/ns-3-alibabacloud/simulation/src/point-to-point/model/qbb-remote-channel.h"
    "/Users/sayan/Sayan/Study/Rinku_maam/NS3_UET/ns-3-alibabacloud/simulation/src/point-to-point/model/rdma-driver.h"
    "/Users/sayan/Sayan/Study/Rinku_maam/NS3_UET/ns-3-alibabacloud/simulation/src/point-to-point/model/rdma-queue-pair.h"
    "/Users/sayan/Sayan/Study/Rinku_maam/NS3_UET/ns-3-alibabacloud/simulation/src/point-to-point/model/rdma-hw.h"
    "/Users/sayan/Sayan/Study/Rinku_maam/NS3_UET/ns-3-alibabacloud/simulation/src/point-to-point/model/switch-node.h"
    "/Users/sayan/Sayan/Study/Rinku_maam/NS3_UET/ns-3-alibabacloud/simulation/src/point-to-point/model/switch-mmu.h"
    "/Users/sayan/Sayan/Study/Rinku_maam/NS3_UET/ns-3-alibabacloud/simulation/src/point-to-point/model/trace-format.h"
    "/Users/sayan/Sayan/Study/Rinku_maam/NS3_UET/ns-3-alibabacloud/simulation/src/point-to-point/model/nvswitch-node.h"
    "/Users/sayan/Sayan/Study/Rinku_maam/NS3_UET/ns-3-alibabacloud/simulation/src/point-to-point/model/point-to-point-remote-channel.h"
    "/Users/sayan/Sayan/Study/Rinku_maam/NS3_UET/ns-3-alibabacloud/simulation/build/include/ns3/point-to-point-module.h"
    )
endif()

string(REPLACE ";" "\n" CMAKE_INSTALL_MANIFEST_CONTENT
       "${CMAKE_INSTALL_MANIFEST_FILES}")
if(CMAKE_INSTALL_LOCAL_ONLY)
  file(WRITE "/Users/sayan/Sayan/Study/Rinku_maam/NS3_UET/ns-3-alibabacloud/simulation/_build_test/src/point-to-point/install_local_manifest.txt"
     "${CMAKE_INSTALL_MANIFEST_CONTENT}")
endif()
