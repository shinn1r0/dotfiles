#!/bin/zsh

sudo apt install autoconf automake pkg-config\
    libevent-dev libncurses5-dev xsel byacc flex

git clone https://github.com/tmux/tmux.git
cd tmux

TMUX_NOW_VERSION=$(tmux -V | awk '{print $2}')
TMUX_NEW_VERSION=$(git tag | grep -E "^[0-9]*\.[0-9]*$" | sort -V | tail -n 1)

if [ $TMUX_NOW_VERSION = $TMUX_NEW_VERSION ]; then
    echo "installed latest version"
else
    git checkout $TMUX_NEW_VERSION
    sh autogen.sh
    ./configure

    CPUNUM=$(lscpu | grep -E "^CPU\(s\):" | awk '{ print $2 }')
    make -j${CPUNUM}

    sudo make install
fi
cd ..
rm -rf tmux
