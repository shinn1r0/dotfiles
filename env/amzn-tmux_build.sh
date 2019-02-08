#!/bin/zsh

sudo yum install automake libevent-devel ncurses-devel xsel

git clone https://github.com/tmux/tmux.git

cd tmux

git checkout $(git tag | sort -V | tail -n 1)

sh autogen.sh

./configure

make

sudo make install

cd ..

rm -rf tmux
