#!/bin/zsh

# pyenv install
if (! type anyenv &> /dev/null); then
    if [ -d "${DOTPATH}" ]; then
        $DOTPATH/env/anyenv.sh
    else
        zsh -c "$(curl -fsSL dots.shinichiro.dev/env/anyenv.sh)"
    fi
fi

anyenv install pyenv
exec $SHELL
