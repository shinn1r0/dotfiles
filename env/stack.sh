#!/bin/zsh

SCRIPT_DIR=$(cd $(dirname $0); pwd)
if (! type stack &> /dev/null); then
    cd ~/ && curl -sSL https://get.haskellstack.org/ | sh
fi

cd ${HOME}
stack setup
stack install --resolver lts-8.24 ghc-mod
stack install --resolver lts-11.22 hdevtools
stack install hlint hindent
#stack install hfmt
cd ${SCRIPT_DIR}
