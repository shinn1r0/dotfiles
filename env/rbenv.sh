#!/bin/zsh

# rbenv clone
git clone https://github.com/rbenv/rbenv.git ~/.rbenv
mkdir -p "$(rbenv root)"/plugins
git clone https://github.com/rbenv/ruby-build.git "$(rbenv root)"/plugins/ruby-build
source ~/.zshenv
# ruby install
rbenv install 2.5.1
rbenv global 2.5.1
# neovim
gem install neovim
