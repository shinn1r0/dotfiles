#!/bin/zsh

sudo apt install automake libevent-dev libncurses5-dev xsel

git clone https://github.com/tmux/tmux.git

cd tmux

git checkout $(git tag | grep -E "^[0-9]*\.[0-9]*$" | sort -V | tail -n 1)

sh autogen.sh

./configure

CPUNUM=$(lscpu | grep -E "^CPU\(s\):" | awk '{ print $2 }')
make -j${CPUNUM}

sudo make install

cd ..

rm -rf tmux
