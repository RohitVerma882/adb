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

project(cmake)

# executable output
set(EXECUTABLE_OUTPUT_PATH ${CMAKE_BINARY_DIR}/bin)

# libs
include(libbase.cmake)
include(libcutils.cmake)
include(libutils.cmake)
include(liblog.cmake)
include(libziparchive.cmake)
include(libandroidfw.cmake)
include(libincfs.cmake)
include(libdiagnoseusb.cmake)
include(libcrypto_utils.cmake)
include(libsparse.cmake)
include(libext4_utils.cmake)
include(liblp.cmake)

# adb, fastboot
include(adb.cmake)
include(fastboot.cmake)