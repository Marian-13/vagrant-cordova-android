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
