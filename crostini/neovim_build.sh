#!/bin/zsh

sudo apt install ninja-build gettext libtool libtool-bin autoconf automake cmake g++ pkg-config unzip
git clone https://github.com/neovim/neovim.git

cd neovim
git checkout $(git tag | sort -V | tail -n 1)

make CMAKE_BUILD_TYPE=RelWithDebInfo
sudo make install

cd ..
rm -rf neovim
