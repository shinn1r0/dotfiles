#!/bin/zsh

# ndenv install
anyenv install ndenv
source $HOME/.zshenv
# golang install
ndenv install v10.8.0
ndenv global v10.8.0
ndenv rehash

npm install -g neovim
