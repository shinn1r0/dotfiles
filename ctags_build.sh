#!/usr/bin/zsh

git clone https://github.com/universal-ctags/ctags.git
cd ctags
./autogen.sh
./configure
make
sudo make install
cd .. && rm -rf ctags
