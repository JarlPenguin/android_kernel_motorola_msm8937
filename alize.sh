#!/bin/bash

## InfixRemix (solomonbooth63@gmail.com)

echo "Welcome to alize"
# This prints ""
red='\033[0;31m'
# This sets the colour Red 
BUILD_START=$(date +"%s")
# This gets the time at the start of the build 
sudo apt-get update --quiet
# This gets updates for server/ci
sudo apt-get install --yes build-essential bc kernel-package libncurses5-dev bzip2 liblz4-tool git curl
# This gets the main Build packages if not already there
git clone https://android.googlesource.com/platform/prebuilts/gcc/linux-x86/aarch64/aarch64-linux-android-4.9 --single-branch toolchain
git clone https://github.com/Martichou/alize_assets -b cedric-a8x-64 A; shopt -s dotglob nullglob; cd A; rm -rf .git; cd ..; mv A/* .; rmdir A
# These clone the Kernel and assets
mkdir Builds
# This makes a directory for Builds
echo "Building Alize Kernel for cedric!"
# This prints ""
sudo chmod a+x build.sh
. build.sh
# This gives the build.sh permissions and runs build script in assets
mv deploy-tg.sh Builds/deploy-tg.sh
# This Moves the telegram bot deployer too the builds directory 
cd Builds
# This changes directory to builds
sudo chmod a+x deploy-tg.sh
. deploy-tg.sh
# This deploys the telegram bot script which uploads the build
ls
# This prints what is is in the builds dir
BUILD_END=$(date +"%s")
# Gets the current time
echo -e "$red Alize Kernel Build Started At $BUILD_START and Finished at $BUILD_END"
# This prints "" in red
