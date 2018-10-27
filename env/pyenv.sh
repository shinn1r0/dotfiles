#!/bin/zsh

# pyenv install
anyenv install pyenv
source ~/.zshenv
# python install
VERSION3=$(pyenv install -l | grep -E "^ *3\.[0-9]*\.[0-9]*$" | sort -V | tail -n 1 | awk '{print $1}')
VERSION2=$(pyenv install -l | grep -E "^ *2\.[0-9]*\.[0-9]*$" | sort -V | tail -n 1 | awk '{print $1}')
pyenv install ${VERSION3}
pyenv install ${VERSION2}
pyenv global ${VERSION3} ${VERSION2}
pyenv rehash
# requirements
pip install --upgrade pip pipenv Pygments neovim pytest flake8 mypy pylint jedi ninja
pip2 install --upgrade pip pipenv Pygments neovim pytest flake8 pylint jedi ninja
ln -s $HOME/dotfiles/env/flake8 $HOME/.config/flake8
