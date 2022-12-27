#!/usr/bin/bash

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

if [[ -z "$NDK_PATH" ]]; then
    echo "Please specify the Android NDK environment variable \"NDK_PATH\"."
    exit 1
fi

CURRENT_DIR="$(pwd)"
NDK_TOOLCHAIN="$NDK_PATH/toolchains/llvm/prebuilt/linux-x86_64"
STRIP="$NDK_TOOLCHAIN/bin/llvm-strip"
CLEAN="$CURRENT_DIR/tools/termux-elf-cleaner"

abi="$1"
api="24"
build_dir="$CURRENT_DIR/build/$abi"
out_dir="$CURRENT_DIR/output/$abi"

cmake -GNinja \
-B "$build_dir" \
-DANDROID_NDK="$NDK_PATH" \
-DCMAKE_TOOLCHAIN_FILE="$NDK_PATH/build/cmake/android.toolchain.cmake" \
-DANDROID_ABI="$abi" \
-DANDROID_NATIVE_API_LEVEL="$api" \
-DCMAKE_SYSTEM_NAME="Android" \
-DCMAKE_BUILD_TYPE="Release" \
-DANDROID_STL="c++_static" || exit 1

ninja -C "$build_dir" "-j$(nproc)" || exit 1

mkdir -p "$out_dir" || exit 1
cp -r "$build_dir/bin" "$out_dir" || exit 1

adb="$out_dir/bin/adb"
fastboot="$out_dir/bin/fastboot"

$STRIP --strip-all "$adb" || exit 1
$STRIP --strip-all "$fastboot" || exit 1

$CLEAN --api-level "$api" "$adb" || exit 1
$CLEAN --api-level "$api" "$fastboot" || exit 1