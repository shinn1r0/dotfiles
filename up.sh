#!/bin/zsh

# update ubuntu packages
echo "ubuntu packages update========================================="
sudo snap refresh
sudo apt update
sudo apt upgrade -y
sudo apt autoremove -y
sudo apt autoclean -y

# update texlive packages
echo "texlive packages update========================================"
sudo tlmgr update --self --all

# environment
echo "programming language environment packages update==============="
echo "pyenv update====================="
cd "$(pyenv root)" && git pull
echo "rbenv update====================="
cd "$(rbenv root)" && git pull
cd "$(rbenv root)"/plugins/ruby-build && git pull
echo "nim update======================="
cd $NIM_HOME && git pull

# update anaconda packages
echo "anaconda packages update======================================="
conda update conda -y
conda update --all -y

# update pip packages
echo "pip packages update============================================"
pip install --upgrade pip
pip list --outdated --format=legacy | awk '{print $1}' | xargs pip install -U

# update gem packages
echo "gem packages update============================================"
gem update --system
gem update `gem list | cut -d ' ' -f 1`

# update npm packages
echo "npm packages update============================================"
npm update -g npm
npm update -g

# update nimble packages
echo "nimble packages update========================================="
nimble refresh
