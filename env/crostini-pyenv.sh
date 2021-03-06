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
exec $SHELL -l
# python install
VERSION=$(pyenv install -l | grep -E "^  anaconda3.*$" | sort -V | tail -n 1 | awk '{print $1}')
pyenv install ${VERSION}
pyenv global ${VERSION}
pyenv rehash
# requirements
pip install --upgrade pip setuptools pipenv Pygments pynvim neovim-remote pytest flake8 mypy pylint jedi ninja awscli
DOTPATH=$HOME/.dotfiles
ln -snfv $DOTPATH/env/flake8 $HOME/.config/flake8

conda install python=3.7.3
conda install -c conda-forge awscli
conda install pytorch-cpu torchvision-cpu -c pytorch
