#!/bin/zsh

if (! type stack &> /dev/null); then
    cd ~/ && curl -sSL https://get.haskellstack.org/ | sh
fi

stack setup
stack install ghc-mod hlint
