#!/bin/bash

ln -s $HOME/dotfiles/.zshenv $HOME/.zshenv
ln -s $HOME/dotfiles/.zshrc $HOME/.zshrc
ln -s $HOME/dotfiles/.tmux.conf $HOME/.tmux.conf
ln -s $HOME/dotfiles/.vim $HOME/.vim
ln -s $HOME/dotfiles/.vimrc $HOME/.vimrc

mkdir -p $HOME/.config 2>/dev/null
mkdir -p $HOME/dotfiles/nvim/backup 2>/dev/null
ln -s $HOME/dotfiles/nvim $HOME/.config/nvim
ln -s $HOME/dotfiles/git $HOME/.config/git
zcompile ${HOME}/.zshrc
