#!/usr/bin/env bash
#
# nvm
# https://github.com/creationix/nvm
# https://nodejs.org/
# https://github.com/robertkowalski/vagrant-nvm/blob/master/provision.sh

NODE_VERSION=$1

curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.34.0/install.sh | bash

cat ~/.profile | grep "source ~/.nvm/nvm.sh" || echo "source ~/.nvm/nvm.sh" >> ~/.profile

source ~/.profile

nvm install $NODE_VERSION
