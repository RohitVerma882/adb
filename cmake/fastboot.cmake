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

add_executable(fastboot
	${SRC}/fastboot/main.cpp
	${SRC}/fastboot/bootimg_utils.cpp
	${SRC}/fastboot/fastboot.cpp
	${SRC}/fastboot/fastboot_driver.cpp
	${SRC}/fastboot/fs.cpp
	${SRC}/fastboot/socket.cpp
	${SRC}/fastboot/tcp.cpp
	${SRC}/fastboot/udp.cpp
	${SRC}/fastboot/usb_linux.cpp
	${SRC}/fastboot/vendor_boot_img_utils.cpp
	${SRC}/fastboot/util.cpp)

target_include_directories(fastboot PRIVATE
	${SRC}/libbase/include
	${SRC}/libsparse/include
    ${SRC}/diagnose_usb/include
	${SRC}/libziparchive/include
	${SRC}/mkbootimg/include/bootimg
    ${SRC}/ext4_utils/include
	${SRC}/liblp/include
	${SRC}/libstorage_literals
	${SRC}
	${SRC_EXTRA}/googletest/googletest/include
    ${SRC_EXTRA}/zlib)
	
target_compile_definitions(fastboot PRIVATE
	-D_GNU_SOURCE
	-D_XOPEN_SOURCE=700
	-DUSE_F2FS)

target_link_libraries(fastboot
	libcutils
    libincfs
	libsparse
	libziparchive
    libandroidfw
	liblog
	liblp
	libutils
	libbase
	libext4_utils
	libdiagnoseusb
	libcrypto
    gtest
	libz)
