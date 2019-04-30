#!/bin/bash

# These export unneeded variables
export DEFCONFIG="montana_defconfig"

# Export User & Host
export KBUILD_BUILD_USER=JARLPENGUIN
export KBUILD_BUILD_HOST=RADIUM

# Sync from source
git pull
# This spits out words
echo "**** Kernel defconfig is set to $DEFCONFIG ****"
# This makes a clean build
echo "**** Cleaning... ***"
make O=out clean
make O=out mrproper
# This builds the kernel
echo "**** Building... ***"
make O=out ARCH=arm64 montana_defconfig
PATH="./clang/clang-r353983d/bin:./toolchain/bin:${PATH}" \
make -j$(nproc --all) O=out \
                      ARCH=arm64 \
                      CC=clang \
                      CLANG_TRIPLE=aarch64-linux-gnu- \
                      CROSS_COMPILE=aarch64-linux-android-
# This packages the kernel
echo -e "**** Packaging.... ****"
cp out/arch/arm64/boot/Image.gz AnyKernel2Template
cd AnyKernel2Template
echo "Building RADIUM  Kernel for montana!"
# This zips the kernel up
rm -rf kernel.zip
zip -r9 kernel.zip * -x README.md kernel.zip

echo "Done. Check ~/AnyKernel2Template for the kernel zip to flash."
