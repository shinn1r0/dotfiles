#!/bin/zsh

# pyenv requirements
sudo apt install -y libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev libncurses5-dev libncursesw5-dev xz-utils tk-dev
# pyenv clone
git clone https://github.com/pyenv/pyenv.git ~/.pyenv
source ~/.zshenv
# python install
pyenv install 3.6.6
pyenv install 2.7.15
pyenv global 3.6.6 2.7.15
# requirements
pip install --upgrade pip pipenv Pygments neovim
