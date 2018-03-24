#!/usr/bin/zsh

sudo apt install automake libevent-dev libncurses5-dev xsel

git clone https://github.com/tmux/tmux.git

cd tmux

git checkout $(git tag | sort -V | tail -n 1)

sh autogen.sh

./configure

make -j8

sudo make install

cd ..

rm -rf tmux
