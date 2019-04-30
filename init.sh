#!/bin/bash

## InfixRemix (solomonbooth63@gmail.com) & JarlPenguin (jarlpenguin@outlook.com)
# This gives you a welcome message
echo "Initializing RADIUM..."
# This updates the lists
sudo apt update --quiet
# This installs dependencies
sudo apt install --yes build-essential bc kernel-package libncurses5-dev bzip2 liblz4-tool git curl
# This gets the main build packages if not already there
git clone https://github.com/PixelExperience/prebuilts_clang_host_linux-x86 clang
git clone https://github.com/jarlpenguin/platform_prebuilts_gcc_linux-x86_aarch64_aarch64-linux-android-4.9 toolchain
git clone https://github.com/jarlpenguin/anykernel2template AnyKernel2Template
. radium.sh
