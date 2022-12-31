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

project(adb)
cmake_minimum_required(VERSION 3.14.2)

# enable languages
enable_language(C CXX ASM)

# use C11 with GNU extensions
set(CMAKE_C_STANDARD 11)
set(CMAKE_C_EXTENSIONS ON)
set(CMAKE_C_STANDARD_REQUIRED ON)

# use C++20 with GNU extensions
set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_EXTENSIONS ON)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# globle flags
add_compile_options(-fcolor-diagnostics -fPIC -Wno-attributes)
add_compile_definitions(_FILE_OFFSET_BITS=64)

# tools version
set(TOOLS_VERSION 33.0.3)
set(TOOLS_VENDOR android-tools)
configure_file(version.h.in src/build/version.h @ONLY)
configure_file(platform_tools_version.h.in src/platform_tools_version.h @ONLY)

# sources
set(SRC ${PROJECT_SOURCE_DIR}/src)
set(SRC_EXTRA ${PROJECT_SOURCE_DIR}/src/external)

# includes
include_directories(${CMAKE_CURRENT_BINARY_DIR})

# building
add_subdirectory(src/external)
add_subdirectory(cmake/external)
add_subdirectory(cmake)
