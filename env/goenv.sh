#!/bin/zsh

# goenv install
if (! type anyenv &> /dev/null); then
    if [ -d "${DOTPATH}" ]; then
        $DOTPATH/env/anyenv.sh
    else
        zsh -c "$(curl -fsSL dots.shinichironaito.com/env/anyenv.sh)"
    fi
fi

anyenv install goenv
exec $SHELL -l
# golang install
VERSION=$(goenv install -l | grep -E "^ *[0-9]*\.[0-9]*\.[0-9]*$" | sort -V | tail -n 1 | awk '{print $1}')
goenv install ${VERSION}
goenv global ${VERSION}
goenv rehash

$DOTPATH/env/gotool.sh
