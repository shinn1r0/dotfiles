#!/bin/bash

# yum packages
# necessary packages
sudo yum update
sudo yum install –y https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
curl -o /etc/yum.repos.d/dperson-neovim-epel-7.repo https://copr.fedorainfracloud.org/coprs/dperson/neovim/repo/epel-7/dperson-neovim-epel-7.repo
sudo yum install -y zsh neovim tmux xsel tree gcc 

# programming language
~/dotfiles/env/pyenv_amazonlinux2.sh

# terminal
cd ~/
## powerline font
git clone https://github.com/powerline/fonts.git --depth=1 && cd fonts && ./install.sh && cd .. & rm -rf fonts
## zplug
git clone https://github.com/zplug/zplug $ZPLUG_HOME
## tmux plugins
mkdir -p ~/.tmux/plugins
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
## fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install
## font
fc-cache -vf

source ~/.zshrc
