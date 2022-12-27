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

add_library(libutils STATIC
    ${SRC}/libutils/Errors.cpp
	${SRC}/libutils/FileMap.cpp
	${SRC}/libutils/JenkinsHash.cpp
	${SRC}/libutils/LightRefBase.cpp
	${SRC}/libutils/NativeHandle.cpp
	${SRC}/libutils/Printer.cpp
	${SRC}/libutils/RefBase.cpp
	${SRC}/libutils/SharedBuffer.cpp
	${SRC}/libutils/StopWatch.cpp
	${SRC}/libutils/String8.cpp
	${SRC}/libutils/String16.cpp
	${SRC}/libutils/StrongPointer.cpp
	${SRC}/libutils/SystemClock.cpp
	${SRC}/libutils/Threads.cpp
	${SRC}/libutils/Timers.cpp
	${SRC}/libutils/Tokenizer.cpp
	${SRC}/libutils/Unicode.cpp
	${SRC}/libutils/VectorImpl.cpp
	${SRC}/libutils/misc.cpp)

target_include_directories(libutils PUBLIC
    ${SRC}/libcutils/include
    ${SRC}/libutils/include 
    ${SRC}/libsystem/include
    ${SRC}/liblog/include 
    ${SRC}/libbase/include)