#!/bin/zsh

# ndenv install
anyenv install nodenv
source $HOME/.zshenv
# golang install
VERSION=$(nodenv install -l | grep -E "^ *[0-9]*[02468]\.[0-9]*\.[0-9]*$" | sort -V | tail -n 1 | awk '{print $1}')
nodenv install ${VERSION}
nodenv global ${VERSION}
nodenv rehash

npm install -g npm neovim
