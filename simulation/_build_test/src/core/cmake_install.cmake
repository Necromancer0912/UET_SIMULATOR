# Install script for directory: /Users/sayan/Sayan/Study/Rinku_maam/NS3_UET/ns-3-alibabacloud/simulation/src/core

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
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE SHARED_LIBRARY FILES "/Users/sayan/Sayan/Study/Rinku_maam/NS3_UET/ns-3-alibabacloud/simulation/build/lib/libns3.36.1-core-optimized.dylib")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libns3.36.1-core-optimized.dylib" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libns3.36.1-core-optimized.dylib")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/usr/bin/strip" -x "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libns3.36.1-core-optimized.dylib")
    endif()
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/ns3" TYPE FILE FILES
    "/Users/sayan/Sayan/Study/Rinku_maam/NS3_UET/ns-3-alibabacloud/simulation/src/core/model/int64x64-128.h"
    "/Users/sayan/Sayan/Study/Rinku_maam/NS3_UET/ns-3-alibabacloud/simulation/src/core/helper/csv-reader.h"
    "/Users/sayan/Sayan/Study/Rinku_maam/NS3_UET/ns-3-alibabacloud/simulation/src/core/helper/event-garbage-collector.h"
    "/Users/sayan/Sayan/Study/Rinku_maam/NS3_UET/ns-3-alibabacloud/simulation/src/core/helper/random-variable-stream-helper.h"
    "/Users/sayan/Sayan/Study/Rinku_maam/NS3_UET/ns-3-alibabacloud/simulation/src/core/model/abort.h"
    "/Users/sayan/Sayan/Study/Rinku_maam/NS3_UET/ns-3-alibabacloud/simulation/src/core/model/ascii-file.h"
    "/Users/sayan/Sayan/Study/Rinku_maam/NS3_UET/ns-3-alibabacloud/simulation/src/core/model/ascii-test.h"
    "/Users/sayan/Sayan/Study/Rinku_maam/NS3_UET/ns-3-alibabacloud/simulation/src/core/model/assert.h"
    "/Users/sayan/Sayan/Study/Rinku_maam/NS3_UET/ns-3-alibabacloud/simulation/src/core/model/atomic-counter.h"
    "/Users/sayan/Sayan/Study/Rinku_maam/NS3_UET/ns-3-alibabacloud/simulation/src/core/model/attribute-accessor-helper.h"
    "/Users/sayan/Sayan/Study/Rinku_maam/NS3_UET/ns-3-alibabacloud/simulation/src/core/model/attribute-construction-list.h"
    "/Users/sayan/Sayan/Study/Rinku_maam/NS3_UET/ns-3-alibabacloud/simulation/src/core/model/attribute-container-accessor-helper.h"
    "/Users/sayan/Sayan/Study/Rinku_maam/NS3_UET/ns-3-alibabacloud/simulation/src/core/model/attribute-container.h"
    "/Users/sayan/Sayan/Study/Rinku_maam/NS3_UET/ns-3-alibabacloud/simulation/src/core/model/attribute-helper.h"
    "/Users/sayan/Sayan/Study/Rinku_maam/NS3_UET/ns-3-alibabacloud/simulation/src/core/model/attribute.h"
    "/Users/sayan/Sayan/Study/Rinku_maam/NS3_UET/ns-3-alibabacloud/simulation/src/core/model/boolean.h"
    "/Users/sayan/Sayan/Study/Rinku_maam/NS3_UET/ns-3-alibabacloud/simulation/src/core/model/breakpoint.h"
    "/Users/sayan/Sayan/Study/Rinku_maam/NS3_UET/ns-3-alibabacloud/simulation/src/core/model/build-profile.h"
    "/Users/sayan/Sayan/Study/Rinku_maam/NS3_UET/ns-3-alibabacloud/simulation/src/core/model/calendar-scheduler.h"
    "/Users/sayan/Sayan/Study/Rinku_maam/NS3_UET/ns-3-alibabacloud/simulation/src/core/model/callback.h"
    "/Users/sayan/Sayan/Study/Rinku_maam/NS3_UET/ns-3-alibabacloud/simulation/src/core/model/command-line.h"
    "/Users/sayan/Sayan/Study/Rinku_maam/NS3_UET/ns-3-alibabacloud/simulation/src/core/model/config.h"
    "/Users/sayan/Sayan/Study/Rinku_maam/NS3_UET/ns-3-alibabacloud/simulation/src/core/model/default-deleter.h"
    "/Users/sayan/Sayan/Study/Rinku_maam/NS3_UET/ns-3-alibabacloud/simulation/src/core/model/default-simulator-impl.h"
    "/Users/sayan/Sayan/Study/Rinku_maam/NS3_UET/ns-3-alibabacloud/simulation/src/core/model/deprecated.h"
    "/Users/sayan/Sayan/Study/Rinku_maam/NS3_UET/ns-3-alibabacloud/simulation/src/core/model/des-metrics.h"
    "/Users/sayan/Sayan/Study/Rinku_maam/NS3_UET/ns-3-alibabacloud/simulation/src/core/model/double.h"
    "/Users/sayan/Sayan/Study/Rinku_maam/NS3_UET/ns-3-alibabacloud/simulation/src/core/model/empty.h"
    "/Users/sayan/Sayan/Study/Rinku_maam/NS3_UET/ns-3-alibabacloud/simulation/src/core/model/enum.h"
    "/Users/sayan/Sayan/Study/Rinku_maam/NS3_UET/ns-3-alibabacloud/simulation/src/core/model/event-id.h"
    "/Users/sayan/Sayan/Study/Rinku_maam/NS3_UET/ns-3-alibabacloud/simulation/src/core/model/event-impl.h"
    "/Users/sayan/Sayan/Study/Rinku_maam/NS3_UET/ns-3-alibabacloud/simulation/src/core/model/fatal-error.h"
    "/Users/sayan/Sayan/Study/Rinku_maam/NS3_UET/ns-3-alibabacloud/simulation/src/core/model/fatal-impl.h"
    "/Users/sayan/Sayan/Study/Rinku_maam/NS3_UET/ns-3-alibabacloud/simulation/src/core/model/global-value.h"
    "/Users/sayan/Sayan/Study/Rinku_maam/NS3_UET/ns-3-alibabacloud/simulation/src/core/model/hash-fnv.h"
    "/Users/sayan/Sayan/Study/Rinku_maam/NS3_UET/ns-3-alibabacloud/simulation/src/core/model/hash-function.h"
    "/Users/sayan/Sayan/Study/Rinku_maam/NS3_UET/ns-3-alibabacloud/simulation/src/core/model/hash-murmur3.h"
    "/Users/sayan/Sayan/Study/Rinku_maam/NS3_UET/ns-3-alibabacloud/simulation/src/core/model/hash.h"
    "/Users/sayan/Sayan/Study/Rinku_maam/NS3_UET/ns-3-alibabacloud/simulation/src/core/model/heap-scheduler.h"
    "/Users/sayan/Sayan/Study/Rinku_maam/NS3_UET/ns-3-alibabacloud/simulation/src/core/model/int-to-type.h"
    "/Users/sayan/Sayan/Study/Rinku_maam/NS3_UET/ns-3-alibabacloud/simulation/src/core/model/int64x64-double.h"
    "/Users/sayan/Sayan/Study/Rinku_maam/NS3_UET/ns-3-alibabacloud/simulation/src/core/model/int64x64.h"
    "/Users/sayan/Sayan/Study/Rinku_maam/NS3_UET/ns-3-alibabacloud/simulation/src/core/model/integer.h"
    "/Users/sayan/Sayan/Study/Rinku_maam/NS3_UET/ns-3-alibabacloud/simulation/src/core/model/length.h"
    "/Users/sayan/Sayan/Study/Rinku_maam/NS3_UET/ns-3-alibabacloud/simulation/src/core/model/list-scheduler.h"
    "/Users/sayan/Sayan/Study/Rinku_maam/NS3_UET/ns-3-alibabacloud/simulation/src/core/model/log-macros-disabled.h"
    "/Users/sayan/Sayan/Study/Rinku_maam/NS3_UET/ns-3-alibabacloud/simulation/src/core/model/log-macros-enabled.h"
    "/Users/sayan/Sayan/Study/Rinku_maam/NS3_UET/ns-3-alibabacloud/simulation/src/core/model/log.h"
    "/Users/sayan/Sayan/Study/Rinku_maam/NS3_UET/ns-3-alibabacloud/simulation/src/core/model/make-event.h"
    "/Users/sayan/Sayan/Study/Rinku_maam/NS3_UET/ns-3-alibabacloud/simulation/src/core/model/map-scheduler.h"
    "/Users/sayan/Sayan/Study/Rinku_maam/NS3_UET/ns-3-alibabacloud/simulation/src/core/model/math.h"
    "/Users/sayan/Sayan/Study/Rinku_maam/NS3_UET/ns-3-alibabacloud/simulation/src/core/model/names.h"
    "/Users/sayan/Sayan/Study/Rinku_maam/NS3_UET/ns-3-alibabacloud/simulation/src/core/model/node-printer.h"
    "/Users/sayan/Sayan/Study/Rinku_maam/NS3_UET/ns-3-alibabacloud/simulation/src/core/model/nstime.h"
    "/Users/sayan/Sayan/Study/Rinku_maam/NS3_UET/ns-3-alibabacloud/simulation/src/core/model/object-base.h"
    "/Users/sayan/Sayan/Study/Rinku_maam/NS3_UET/ns-3-alibabacloud/simulation/src/core/model/object-factory.h"
    "/Users/sayan/Sayan/Study/Rinku_maam/NS3_UET/ns-3-alibabacloud/simulation/src/core/model/object-map.h"
    "/Users/sayan/Sayan/Study/Rinku_maam/NS3_UET/ns-3-alibabacloud/simulation/src/core/model/object-ptr-container.h"
    "/Users/sayan/Sayan/Study/Rinku_maam/NS3_UET/ns-3-alibabacloud/simulation/src/core/model/object-vector.h"
    "/Users/sayan/Sayan/Study/Rinku_maam/NS3_UET/ns-3-alibabacloud/simulation/src/core/model/object.h"
    "/Users/sayan/Sayan/Study/Rinku_maam/NS3_UET/ns-3-alibabacloud/simulation/src/core/model/pair.h"
    "/Users/sayan/Sayan/Study/Rinku_maam/NS3_UET/ns-3-alibabacloud/simulation/src/core/model/pointer.h"
    "/Users/sayan/Sayan/Study/Rinku_maam/NS3_UET/ns-3-alibabacloud/simulation/src/core/model/priority-queue-scheduler.h"
    "/Users/sayan/Sayan/Study/Rinku_maam/NS3_UET/ns-3-alibabacloud/simulation/src/core/model/ptr.h"
    "/Users/sayan/Sayan/Study/Rinku_maam/NS3_UET/ns-3-alibabacloud/simulation/src/core/model/random-variable-stream.h"
    "/Users/sayan/Sayan/Study/Rinku_maam/NS3_UET/ns-3-alibabacloud/simulation/src/core/model/ref-count-base.h"
    "/Users/sayan/Sayan/Study/Rinku_maam/NS3_UET/ns-3-alibabacloud/simulation/src/core/model/rng-seed-manager.h"
    "/Users/sayan/Sayan/Study/Rinku_maam/NS3_UET/ns-3-alibabacloud/simulation/src/core/model/rng-stream.h"
    "/Users/sayan/Sayan/Study/Rinku_maam/NS3_UET/ns-3-alibabacloud/simulation/src/core/model/scheduler.h"
    "/Users/sayan/Sayan/Study/Rinku_maam/NS3_UET/ns-3-alibabacloud/simulation/src/core/model/show-progress.h"
    "/Users/sayan/Sayan/Study/Rinku_maam/NS3_UET/ns-3-alibabacloud/simulation/src/core/model/simple-ref-count.h"
    "/Users/sayan/Sayan/Study/Rinku_maam/NS3_UET/ns-3-alibabacloud/simulation/src/core/model/simulation-singleton.h"
    "/Users/sayan/Sayan/Study/Rinku_maam/NS3_UET/ns-3-alibabacloud/simulation/src/core/model/simulator-impl.h"
    "/Users/sayan/Sayan/Study/Rinku_maam/NS3_UET/ns-3-alibabacloud/simulation/src/core/model/simulator.h"
    "/Users/sayan/Sayan/Study/Rinku_maam/NS3_UET/ns-3-alibabacloud/simulation/src/core/model/singleton.h"
    "/Users/sayan/Sayan/Study/Rinku_maam/NS3_UET/ns-3-alibabacloud/simulation/src/core/model/string.h"
    "/Users/sayan/Sayan/Study/Rinku_maam/NS3_UET/ns-3-alibabacloud/simulation/src/core/model/synchronizer.h"
    "/Users/sayan/Sayan/Study/Rinku_maam/NS3_UET/ns-3-alibabacloud/simulation/src/core/model/system-path.h"
    "/Users/sayan/Sayan/Study/Rinku_maam/NS3_UET/ns-3-alibabacloud/simulation/src/core/model/system-wall-clock-ms.h"
    "/Users/sayan/Sayan/Study/Rinku_maam/NS3_UET/ns-3-alibabacloud/simulation/src/core/model/system-wall-clock-timestamp.h"
    "/Users/sayan/Sayan/Study/Rinku_maam/NS3_UET/ns-3-alibabacloud/simulation/src/core/model/test.h"
    "/Users/sayan/Sayan/Study/Rinku_maam/NS3_UET/ns-3-alibabacloud/simulation/src/core/model/time-printer.h"
    "/Users/sayan/Sayan/Study/Rinku_maam/NS3_UET/ns-3-alibabacloud/simulation/src/core/model/timer-impl.h"
    "/Users/sayan/Sayan/Study/Rinku_maam/NS3_UET/ns-3-alibabacloud/simulation/src/core/model/timer.h"
    "/Users/sayan/Sayan/Study/Rinku_maam/NS3_UET/ns-3-alibabacloud/simulation/src/core/model/trace-source-accessor.h"
    "/Users/sayan/Sayan/Study/Rinku_maam/NS3_UET/ns-3-alibabacloud/simulation/src/core/model/traced-callback.h"
    "/Users/sayan/Sayan/Study/Rinku_maam/NS3_UET/ns-3-alibabacloud/simulation/src/core/model/traced-value.h"
    "/Users/sayan/Sayan/Study/Rinku_maam/NS3_UET/ns-3-alibabacloud/simulation/src/core/model/trickle-timer.h"
    "/Users/sayan/Sayan/Study/Rinku_maam/NS3_UET/ns-3-alibabacloud/simulation/src/core/model/tuple.h"
    "/Users/sayan/Sayan/Study/Rinku_maam/NS3_UET/ns-3-alibabacloud/simulation/src/core/model/type-id.h"
    "/Users/sayan/Sayan/Study/Rinku_maam/NS3_UET/ns-3-alibabacloud/simulation/src/core/model/type-name.h"
    "/Users/sayan/Sayan/Study/Rinku_maam/NS3_UET/ns-3-alibabacloud/simulation/src/core/model/type-traits.h"
    "/Users/sayan/Sayan/Study/Rinku_maam/NS3_UET/ns-3-alibabacloud/simulation/src/core/model/uinteger.h"
    "/Users/sayan/Sayan/Study/Rinku_maam/NS3_UET/ns-3-alibabacloud/simulation/src/core/model/unix-fd-reader.h"
    "/Users/sayan/Sayan/Study/Rinku_maam/NS3_UET/ns-3-alibabacloud/simulation/src/core/model/unused.h"
    "/Users/sayan/Sayan/Study/Rinku_maam/NS3_UET/ns-3-alibabacloud/simulation/src/core/model/valgrind.h"
    "/Users/sayan/Sayan/Study/Rinku_maam/NS3_UET/ns-3-alibabacloud/simulation/src/core/model/vector.h"
    "/Users/sayan/Sayan/Study/Rinku_maam/NS3_UET/ns-3-alibabacloud/simulation/src/core/model/watchdog.h"
    "/Users/sayan/Sayan/Study/Rinku_maam/NS3_UET/ns-3-alibabacloud/simulation/src/core/model/random-variable.h"
    "/Users/sayan/Sayan/Study/Rinku_maam/NS3_UET/ns-3-alibabacloud/simulation/build/include/ns3/config-store-config.h"
    "/Users/sayan/Sayan/Study/Rinku_maam/NS3_UET/ns-3-alibabacloud/simulation/build/include/ns3/core-config.h"
    "/Users/sayan/Sayan/Study/Rinku_maam/NS3_UET/ns-3-alibabacloud/simulation/build/include/ns3/core-module.h"
    )
endif()

string(REPLACE ";" "\n" CMAKE_INSTALL_MANIFEST_CONTENT
       "${CMAKE_INSTALL_MANIFEST_FILES}")
if(CMAKE_INSTALL_LOCAL_ONLY)
  file(WRITE "/Users/sayan/Sayan/Study/Rinku_maam/NS3_UET/ns-3-alibabacloud/simulation/_build_test/src/core/install_local_manifest.txt"
     "${CMAKE_INSTALL_MANIFEST_CONTENT}")
endif()
