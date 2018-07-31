#!/bin/zsh

# nodebrew install
cd ~/ && curl -L git.io/nodebrew | perl - setup
# node install
nodebrew install-binary v10.4.1
nodebrew use v10.4.1
# neovim
npm install -g neovim
