#!/bin/zsh

if (! type go &> /dev/null); then
    $DOTPATH/env/goenv.sh
fi

SCRIPT_DIR=$(cd $(dirname $0); pwd)

cd $SCRIPT_DIR

git clone \
  --config transfer.fsckobjects=false \
  --config receive.fsckobjects=false \
  --config fetch.fsckobjects=false \
  https://github.com/github/hub.git

cd hub
mkdir -p $HOME/.zsh/completions 2>/dev/null
cp etc/hub.zsh_completion $HOME/.zsh/completions/_hub

make install prefix=$HOME/.local

cd $SCRIPT_DIR
rm -rf hub
