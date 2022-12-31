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

add_library(liblp STATIC
	${SRC}/liblp/images.cpp
	${SRC}/liblp/partition_opener.cpp
	${SRC}/liblp/reader.cpp
	${SRC}/liblp/utility.cpp
	${SRC}/liblp/writer.cpp)
	
target_include_directories(liblp PUBLIC
	${SRC}/liblp/include
	${SRC}/libbase/include
    ${SRC}/libcutils/include
	${SRC}/ext4_utils/include
	${SRC}/libsparse/include
	${SRC_EXTRA}/boringssl/include)
	
target_link_libraries(liblp PUBLIC fmt::fmt)
