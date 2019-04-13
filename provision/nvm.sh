#!/usr/bin/env bash
# https://github.com/creationix/nvm
# https://nodejs.org/
# https://github.com/robertkowalski/vagrant-nvm/blob/master/provision.sh

NODE_VERSION=$1

curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.34.0/install.sh | bash

echo "source ~/.nvm/nvm.sh" >> .profile

source .profile

nvm install $NODE_VERSION
