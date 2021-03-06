#!/bin/zsh

sudo apt install ninja-build gettext libtool libtool-bin autoconf automake cmake g++ pkg-config unzip
pip install ninja

SCRIPT_DIR=$(cd $(dirname $0); pwd)
cd $SCRIPT_DIR

git clone https://github.com/neovim/neovim.git

cd neovim

if (! type nvim &> /dev/null); then
    git checkout stable
    make CMAKE_BUILD_TYPE=RelWithDebInfo
    sudo make install
else
    NVIM_NOW_VERSION=$(nvim -v | head -n 1 | awk '{print $2}' | awk -F - '{print $1}')
    NVIM_NEW_VERSION=$(git tag | grep -E "^v[0-9]*\.[0-9]*\.[0-9]*$" | sort -V | tail -n 1)

    if [ $NVIM_NOW_VERSION = $NVIM_NEW_VERSION ]; then
        echo "installed latest version"
    else
        git checkout stable
        make CMAKE_BUILD_TYPE=RelWithDebInfo
        sudo make install
    fi
fi
cd $SCRIPT_DIR
sudo rm -rf neovim
