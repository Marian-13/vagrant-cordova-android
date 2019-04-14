#!/usr/bin/env bash
#
# Vim
# https://www.vim.org/

sudo apt-get install vim


#!/usr/bin/env bash
#
# nvm
# https://github.com/creationix/nvm
# https://nodejs.org/
# https://github.com/robertkowalski/vagrant-nvm/blob/master/provision.sh

NODE_VERSION='10.15.3'

curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.34.0/install.sh | bash

echo "source ~/.nvm/nvm.sh" >> .profile

source .profile

nvm install $NODE_VERSION


#!/usr/bin/env bash
#
# jabba
# https://github.com/shyiko/jabba
# https://github.com/shyiko/jabba#installation

JAVA_VERSION='1.8'

curl -sL https://github.com/shyiko/jabba/raw/master/install.sh | bash && . ~/.jabba/jabba.sh

jabba install $JAVA_VERSION
jabba alias default $JAVA_VERSION


#!/usr/bin/env bash
#
# zip
# https://www.luminanetworks.com/docs-lsc-610/Topics/SDN_Controller_Software_Installation_Guide/Appendix/Installing_Zip_and_Unzip_for_Ubuntu_1.html
#
# unzip
# https://www.luminanetworks.com/docs-lsc-610/Topics/SDN_Controller_Software_Installation_Guide/Appendix/Installing_Zip_and_Unzip_for_Ubuntu_1.html
#
# sdk
# https://sdkman.io/
# https://sdkman.io/install
#
# gradle
# https://gradle.org/
# https://gradle.org/install/

sudo apt-get -y install zip
sudo apt-get -y install unzip

curl -s https://get.sdkman.io | bash
source ~/.sdkman/bin/sdkman-init.sh

sdk install gradle


#!/usr/bin/env bash
#
# Cordova
# https://cordova.apache.org/
# https://cordova.apache.org/#getstarted

CORDOVA_VERSION='9.0.0'

npm install -g cordova@$CORDOVA_VERSION


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

ANDROID_SDK_TOOLS_VERSION='4333796'
ANDROID_PLATFORM_VERSION='platforms;android-28'
ANDROID_BUILD_TOOLS_VERSION='build-tools;28.0.3'
ANDROID_SYSTEM_IMAGE_VERSION='system-images;android-28;google_apis;x86_64'
ANDROID_AVD_NAME='test'

sudo apt-get -y install zip
sudo apt-get -y install unzip

wget https://dl.google.com/android/repository/sdk-tools-linux-$ANDROID_SDK_TOOLS_VERSION.zip --no-clobber --directory-prefix=./android
unzip -n ./android/sdk-tools-linux-$ANDROID_SDK_TOOLS_VERSION.zip -d ./android

cat ~/.profile | grep "ANDROID_HOME="     || echo "export ANDROID_HOME=~/android" >> ~/.profile
cat ~/.profile | grep "ANDROID_SDK_ROOT=" || echo "export ANDROID_SDK_ROOT=~/android" >> ~/.profile
cat ~/.profile | grep "ANDROID_SDK_HOME=" || echo "export ANDROID_SDK_HOME=~" >> ~/.profile
source ~/.profile

echo $PATH | grep "${ANDROID_HOME}/tools[:|$]"          || echo 'export PATH="${PATH}:${ANDROID_HOME}/tools"' >> ~/.profile
echo $PATH | grep "${ANDROID_HOME}/tools/bin[:|$]"      || echo 'export PATH="${PATH}:${ANDROID_HOME}/tools/bin"' >> ~/.profile
echo $PATH | grep "${ANDROID_HOME}/platform-tools[:|$]" || echo 'export PATH="${PATH}:${ANDROID_HOME}/platform-tools"' >> ~/.profile

source ~/.profile

touch ~/.android/repositories.cfg

sdkmanager $ANDROID_PLATFORM_VERSION
echo hello
echo $ANDROID_BUILD_TOOLS_VERSION
sdkmanager $ANDROID_BUILD_TOOLS_VERSION
yes | sdkmanager "platform-tools"
yes | sdkmanager $ANDROID_SYSTEM_IMAGE_VERSION
yes | sdkmanager --licenses

yes '' | avdmanager create avd -n $ANDROID_AVD_NAME -k $ANDROID_SYSTEM_IMAGE_VERSION

sudo apt-get update

sudo apt-get install -y qemu-kvm libvirt-bin ubuntu-vm-builder bridge-utils
sudo apt-get install -y libglu1
