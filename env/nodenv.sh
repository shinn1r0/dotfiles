#!/bin/zsh

# ndenv install
anyenv install nodenv
source $HOME/.zshenv
# golang install
nodenv install v8.11.3
nodenv global v8.11.3
nodenv rehash

npm install -g npm neovim
