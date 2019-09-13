#!/bin/zsh

if (! type go &> /dev/null); then
    $DOTPATH/env/goenv.sh
fi

git clone \
  --config transfer.fsckobjects=false \
  --config receive.fsckobjects=false \
  --config fetch.fsckobjects=false \
  https://github.com/github/hub.git

cd hub
make install prefix=/usr/local

rm -rf hub
