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

project(external-src)

# precompiled libs
add_library(libprotobuf STATIC IMPORTED GLOBAL)
add_library(libcrypto STATIC IMPORTED GLOBAL)
add_library(libssl STATIC IMPORTED GLOBAL)
set_target_properties(libprotobuf PROPERTIES IMPORTED_LOCATION "${SRC_EXTRA}/protobuf/lib/${ANDROID_ABI}/libprotobuf.a")
set_target_properties(libcrypto PROPERTIES IMPORTED_LOCATION "${SRC_EXTRA}/boringssl/lib/${ANDROID_ABI}/libcrypto.a")
set_target_properties(libssl PROPERTIES IMPORTED_LOCATION "${SRC_EXTRA}/boringssl/lib/${ANDROID_ABI}/libssl.a")

# external projects
add_subdirectory(fmtlib EXCLUDE_FROM_ALL)
add_subdirectory(googletest EXCLUDE_FROM_ALL)
add_subdirectory(zstd/build/cmake EXCLUDE_FROM_ALL)
add_subdirectory(lz4/build/cmake EXCLUDE_FROM_ALL)
add_subdirectory(brotli EXCLUDE_FROM_ALL)