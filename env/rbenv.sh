#!/bin/zsh

# rbenv install
if (! type anyenv &> /dev/null); then
    if [ -d "${DOTPATH}" ]; then
        $DOTPATH/env/anyenv.sh
    else
        zsh -c "$(curl -fsSL dots.shinichiro.dev/env/anyenv.sh)"
    fi
fi

anyenv install rbenv
exec $SHELL -l
# ruby install
VERSION=$(rbenv install -l | grep -E "^ *[0-9]*\.[0-9]*\.[0-9]*$" | sort -V | tail -n 1 | awk '{print $1}')
rbenv install ${VERSION}
rbenv global ${VERSION}
rbenv rehash
# neovim
gem install neovim
gem update `gem list | cut -d ' ' -f 1`
