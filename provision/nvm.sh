#!/usr/bin/env bash
#
# nvm
# https://github.com/creationix/nvm
# https://nodejs.org/
# https://github.com/robertkowalski/vagrant-nvm/blob/master/provision.sh

NODE_VERSION=$1

curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.34.0/install.sh | bash

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

nvm install $NODE_VERSION
