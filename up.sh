#!/bin/zsh

# update ubuntu packages
sudo apt update
sudo apt upgrade -y
sudo apt autoremove -y
sudo apt autoclean -y

# update texlive packages
sudo tlmgr update --self --all

# environment
cd "$(pyenv root)" && git pull
cd "$(rbenv root)" && git pull
cd "$(rbenv root)"/plugins/ruby-build && git pull

# update anaconda packages
conda update conda -y
conda update --all -y

# update pip packages
pip install --upgrade pip
pip list --outdated --format=legacy | awk '{print $1}' | xargs pip install -U
pip check

# update gem packages
gem update --system
gem update bundler
gem update `gem list | cut -d ' ' -f 1`

# update npm packages
npm update -g npm
npm update -g
