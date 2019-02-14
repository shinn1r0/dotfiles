#!/bin/bash

sudo yum install zlib-devel bzip2 bzip2-devel readline-devel sqlite sqlite-devel openssl-devel xz xz-devel
git clone https://github.com/pyenv/pyenv.git ~/.pyenv
exec $SHELL -l
pyenv install 3.6.6
pyenv global 3.6.6
pip install --upgrade pip pipenv neovim jedi
