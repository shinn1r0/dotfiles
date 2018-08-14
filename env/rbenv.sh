#!/bin/zsh

# rbenv install
anyenv install rbenv
source ~/.zshenv
# ruby install
rbenv install 2.5.1
rbenv global 2.5.1
rbenv rehash
# neovim
gem install neovim
