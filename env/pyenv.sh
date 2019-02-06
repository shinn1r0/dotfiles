#!/bin/zsh

# pyenv install
if (! type anyenv &> /dev/null); then
    if [ -d "${DOTPATH}" ]; then
        $DOTPATH/env/anyenv.sh
    else
        zsh -c "$(curl -fsSL dots.shinichironaito.com/env/anyenv.sh)"
    fi
fi

anyenv install pyenv
exec $SHELL
# python install
VERSION=$(pyenv install -l | grep -E "^ *3\.[0-9]*\.[0-9]*$" | sort -V | tail -n 1 | awk '{print $1}')
pyenv install ${VERSION}
pyenv global ${VERSION}
pyenv rehash
# requirements
pip install --upgrade pip setuptools pipenv Pygments pynvim pytest flake8 mypy pylint jedi ninja
DOTPATH=$HOME/.dotfiles
ln -snfv $DOTPATH/env/flake8 $HOME/.config/flake8
