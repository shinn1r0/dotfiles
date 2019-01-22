#!/bin/zsh

# pyenv install
anyenv install pyenv
source ~/.zshenv
# python install
VERSION=$(pyenv install -l | grep -E "^ *3\.[0-9]*\.[0-9]*$" | sort -V | tail -n 1 | awk '{print $1}')
pyenv install ${VERSION}
pyenv global ${VERSION}
pyenv rehash
# requirements
pip install --upgrade pip pipenv Pygments pynvim pytest flake8 mypy pylint jedi ninja
ln -s $HOME/dotfiles/env/flake8 $HOME/.config/flake8
