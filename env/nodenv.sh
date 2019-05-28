#!/bin/zsh

# ndenv install
if (! type anyenv &> /dev/null); then
    if [ -d "${DOTPATH}" ]; then
        $DOTPATH/env/anyenv.sh
    else
        zsh -c "$(curl -fsSL dots.shinichironaito.com/env/anyenv.sh)"
    fi
fi

anyenv install nodenv
exec $SHELL -l
# golang install
VERSION=$(nodenv install -l | grep -E "^ *[0-9]*[02468]\.[0-9]*\.[0-9]*$" | sort -V | tail -n 1 | awk '{print $1}')
nodenv install ${VERSION}
nodenv global ${VERSION}
nodenv rehash

npm install -g npm neovim
