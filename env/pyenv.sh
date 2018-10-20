#!/bin/zsh

# pyenv install
anyenv install pyenv
source ~/.zshenv
# python install
pyenv install 3.7.0
pyenv install 3.6.6
pyenv install 2.7.15
pyenv global 3.6.6 2.7.15
pyenv rehash
# requirements
pip install --upgrade pip pipenv Pygments neovim pytest flake8 mypy pylint jedi ninja
ln -s $HOME/dotfiles/flake8 $HOME/.config/flake8
