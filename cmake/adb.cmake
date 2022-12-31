#
# Copyright © 2022 Github RohitVerma882
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# ========================= adb proto ============================
set(ADB_PROTO_SRC)  # adb proto source files
set(ADB_PROTO_HDRS) # adb proto head files
set(ADB_PROTO_DIR ${SRC}/adb/proto)

file(GLOB_RECURSE PROTO_FILES ${ADB_PROTO_DIR}/*.proto)

foreach(proto ${PROTO_FILES})
    get_filename_component(FIL_WE ${proto} NAME_WE)
    
    set(TARGET_CPP_FILE "${ADB_PROTO_DIR}/${FIL_WE}.pb.cc")
    set(TARGET_HEAD_FILE "${ADB_PROTO_DIR}/${FIL_WE}.pb.h")
   
    if(EXISTS ${TARGET_CPP_FILE} AND EXISTS ${TARGET_HEAD_FILE})
        list(APPEND ADB_PROTO_SRC ${TARGET_CPP_FILE})
        list(APPEND ADB_PROTO_HDRS ${TARGET_HEAD_FILE})
    endif()
endforeach()

set_source_files_properties(${ADB_PROTO_SRC} PROPERTIES GENERATED TRUE)
set_source_files_properties(${ADB_PROTO_HDRS} PROPERTIES GENERATED TRUE)
# ========================= adb proto ============================


# ========================= fastdeploy proto ============================
# ApkEntry.proto
set(FASTDEPLOY_PROTO_SRC)  # adb proto source files
set(FASTDEPLOY_PROTO_HDRS) # adb proto head files
set(FASTDEPLOY_PROTO_DIR ${SRC}/adb/fastdeploy/proto)

set(TARGET_CPP_FILE "${FASTDEPLOY_PROTO_DIR}/ApkEntry.pb.cc")
set(TARGET_HEAD_FILE "${FASTDEPLOY_PROTO_DIR}/ApkEntry.pb.h")
    
if(EXISTS ${TARGET_CPP_FILE} AND EXISTS ${TARGET_HEAD_FILE})
    list(APPEND FASTDEPLOY_PROTO_SRC ${TARGET_CPP_FILE})
    list(APPEND FASTDEPLOY_PROTO_HDRS ${TARGET_HEAD_FILE})
endif()

set_source_files_properties(${FASTDEPLOY_PROTO_SRC} PROPERTIES GENERATED TRUE)
set_source_files_properties(${FASTDEPLOY_PROTO_HDRS} PROPERTIES GENERATED TRUE)
# ========================= fastdeploy proto ============================


add_executable(adb
    ${SRC}/adb/client/adb_client.cpp
    ${SRC}/adb/client/bugreport.cpp
    ${SRC}/adb/client/commandline.cpp
    ${SRC}/adb/client/file_sync_client.cpp
    ${SRC}/adb/client/main.cpp
    ${SRC}/adb/client/console.cpp
    ${SRC}/adb/client/adb_install.cpp
    ${SRC}/adb/client/line_printer.cpp
    ${SRC}/adb/client/fastdeploy.cpp
    ${SRC}/adb/client/fastdeploycallbacks.cpp
    ${SRC}/adb/client/incremental.cpp
    ${SRC}/adb/client/incremental_server.cpp
    ${SRC}/adb/client/incremental_utils.cpp
    ${SRC}/adb/client/auth.cpp
    ${SRC}/adb/client/adb_wifi.cpp
    ${SRC}/adb/client/usb_libusb.cpp
    ${SRC}/adb/client/transport_local.cpp
    ${SRC}/adb/client/transport_usb.cpp
    ${SRC}/adb/client/pairing/pairing_client.cpp
    ${SRC}/adb/client/usb_linux.cpp
    ${SRC}/adb/shell_service_protocol.cpp
    ${SRC}/adb/adb.cpp
    ${SRC}/adb/adb_io.cpp
    ${SRC}/adb/adb_listeners.cpp
    ${SRC}/adb/adb_trace.cpp
    ${SRC}/adb/adb_unique_fd.cpp
    ${SRC}/adb/adb_utils.cpp
    ${SRC}/adb/fdevent/fdevent.cpp
    ${SRC}/adb/fdevent/fdevent_epoll.cpp
    ${SRC}/adb/services.cpp
    ${SRC}/adb/sockets.cpp
    ${SRC}/adb/socket_spec.cpp
    ${SRC}/adb/sysdeps/env.cpp
    ${SRC}/adb/sysdeps/errno.cpp
    ${SRC}/adb/sysdeps_unix.cpp
    ${SRC}/adb/sysdeps/posix/network.cpp
    ${SRC}/adb/sysdeps/env.cpp
    ${SRC}/adb/transport.cpp
    ${SRC}/adb/transport_fd.cpp
    ${SRC}/adb/types.cpp
    ${SRC}/adb/crypto/key.cpp
    ${SRC}/adb/crypto/rsa_2048_key.cpp
    ${SRC}/adb/crypto/x509_generator.cpp
    ${SRC}/adb/tls/adb_ca_list.cpp
    ${SRC}/adb/tls/tls_connection.cpp
    ${SRC}/adb/pairing_connection/pairing_connection.cpp
    ${SRC}/adb/pairing_auth/aes_128_gcm.cpp
    ${SRC}/adb/pairing_auth/pairing_auth.cpp
    ${SRC}/adb/fastdeploy/deploypatchgenerator/apk_archive.cpp
    ${SRC}/adb/fastdeploy/deploypatchgenerator/deploy_patch_generator.cpp
    ${SRC}/adb/fastdeploy/deploypatchgenerator/patch_utils.cpp
    ${SRC}/adb/fastdeploy/proto/ApkEntry.proto
    ${ADB_PROTO_SRC} ${ADB_PROTO_HDRS}
    ${FASTDEPLOY_PROTO_SRC} ${FASTDEPLOY_PROTO_HDRS})
    
target_include_directories(adb PRIVATE
    ${SRC}/adb
    ${SRC}/adb/proto
    ${SRC}/adb/fastdeploy/deployagent
    ${SRC}/adb/crypto/include
    ${SRC}/adb/pairing_auth/include
    ${SRC}/adb/pairing_connection/include
    ${SRC}/adb/tls/include
    ${SRC}/androidfw/include
    ${SRC}/libbase/include
    ${SRC}/libziparchive/include
    ${SRC}/libcrypto_utils/include
    ${SRC}/libcutils/include
    ${SRC}/diagnose_usb/include
    ${SRC}/incfs/util/include
    ${SRC_EXTRA}/protobuf/src
    ${SRC_EXTRA}/lz4/lib
    ${SRC_EXTRA}/zstd/lib
    ${SRC_EXTRA}/libusb
    ${SRC_EXTRA}/brotli/c/include
    ${SRC_EXTRA}/fmtlib/include
    ${SRC_EXTRA}/boringssl/include
    ${SRC_EXTRA}/googletest/googletest/include
    ${SRC_EXTRA}/zlib)
    
target_compile_definitions(adb PRIVATE 
    -D_GNU_SOURCE
    -DADB_HOST=1
    -DENABLE_FASTDEPLOY)

target_link_libraries(adb
    libbase
    libutils
    libcutils
    libdiagnoseusb
    libandroidfw
    libziparchive
    liblog
    libincfs
    libcrypto_utils
    libcrypto
    libssl
    libprotobuf
    libusb
    brotlicommon-static
    brotlidec-static
    brotlienc-static
    libzstd_static
    lz4_static
    libz)
