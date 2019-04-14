#!/usr/bin/env bash
#
# wget
# https://linux.die.net/man/1/wget
#
# zip
# https://www.luminanetworks.com/docs-lsc-610/Topics/SDN_Controller_Software_Installation_Guide/Appendix/Installing_Zip_and_Unzip_for_Ubuntu_1.html
#
# unzip
# https://linux.die.net/man/1/unzip
# https://www.luminanetworks.com/docs-lsc-610/Topics/SDN_Controller_Software_Installation_Guide/Appendix/Installing_Zip_and_Unzip_for_Ubuntu_1.html
# https://linuxize.com/post/how-to-unzip-files-in-linux/
#
# grep
# https://www.cyberciti.biz/faq/grep-regular-expressions/
# https://stackoverflow.com/questions/18147884/shell-variable-in-a-grep-regex
#
# Android
# https://developer.android.com/studio
# https://linoxide.com/linux-how-to/install-android-sdk-manager-ubuntu/
# https://developer.android.com/studio/#downloads

ANDROID_SDK_TOOLS_VERSION=$1
ANDROID_PLATFORM_VERSION=$2
ANDROID_BUILD_TOOLS_VERSION=$3
ANDROID_SYSTEM_IMAGE_VERSION=$4
ANDROID_AVD_NAME=$5

sudo apt-get -y install zip
sudo apt-get -y install unzip

wget https://dl.google.com/android/repository/sdk-tools-linux-$ANDROID_SDK_TOOLS_VERSION.zip --no-clobber --directory-prefix=$HOME/android
unzip -n ~/android/sdk-tools-linux-$ANDROID_SDK_TOOLS_VERSION.zip -d ~/android

cat ~/.profile | grep "ANDROID_HOME="     || echo "export ANDROID_HOME=~/android" >> ~/.profile
cat ~/.profile | grep "ANDROID_SDK_ROOT=" || echo "export ANDROID_SDK_ROOT=~/android" >> ~/.profile
cat ~/.profile | grep "ANDROID_SDK_HOME=" || echo "export ANDROID_SDK_HOME=~" >> ~/.profile

source ~/.profile

echo $PATH | grep "${ANDROID_HOME}/tools[:|$]"          || echo 'export PATH="${PATH}:${ANDROID_HOME}/tools"' >> ~/.profile
echo $PATH | grep "${ANDROID_HOME}/tools/bin[:|$]"      || echo 'export PATH="${PATH}:${ANDROID_HOME}/tools/bin"' >> ~/.profile
echo $PATH | grep "${ANDROID_HOME}/platform-tools[:|$]" || echo 'export PATH="${PATH}:${ANDROID_HOME}/platform-tools"' >> ~/.profile

source ~/.profile

touch ~/.android/repositories.cfg

yes | sdkmanager $ANDROID_PLATFORM_VERSION
yes | sdkmanager $ANDROID_BUILD_TOOLS_VERSION
yes | sdkmanager "platform-tools"
yes | sdkmanager $ANDROID_SYSTEM_IMAGE_VERSION
yes | sdkmanager --licenses

yes '' | avdmanager create avd -n $ANDROID_AVD_NAME -k $ANDROID_SYSTEM_IMAGE_VERSION

sudo apt-get update

sudo apt-get install -y qemu-kvm libvirt-bin ubuntu-vm-builder bridge-utils
sudo apt-get install -y libglu1
