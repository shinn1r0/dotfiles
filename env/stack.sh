#!/bin/zsh

SCRIPT_DIR=$(cd $(dirname $0); pwd)
if (! type stack &> /dev/null); then
    cd ~/ && curl -sSL https://get.haskellstack.org/ | sh
fi

stack setup
cd ${HOME} && stack install ghc-mod hlint && cd ${SCRIPT_DIR}
