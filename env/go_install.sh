#!/bin/zsh

# golang install
VERSION=$(goenv install -l | grep -E "^ *[0-9]*\.[0-9]*\.[0-9]*$" | sort -V | tail -n 1 | awk '{print $1}')
goenv install ${VERSION}
goenv global ${VERSION}
goenv rehash

$DOTPATH/env/gotool.sh
