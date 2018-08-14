#!/bin/zsh

# ndenv install
anyenv install nodenv
source $HOME/.zshenv
# golang install
nodenv install 8.11.3
nodenv global 8.11.3
nodenv rehash

npm install -g npm neovim
