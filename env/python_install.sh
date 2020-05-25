#!/bin/zsh

# python install
VERSION=$(pyenv install -l | grep -E "^ *3\.[0-9]*\.[0-9]*$" | sort -V | tail -n 1 | awk '{print $1}')
pyenv install ${VERSION}
pyenv global ${VERSION}
pyenv rehash
# requirements
pip install --upgrade pip setuptools pipenv Pygments pynvim neovim-remote pytest flake8 mypy pylint jedi ninja awscli
DOTPATH=$HOME/.dotfiles
ln -snfv $DOTPATH/env/flake8 $HOME/.config/flake8
