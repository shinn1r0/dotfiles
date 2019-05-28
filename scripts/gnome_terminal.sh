#!/bin/zsh

DOTPATH=$HOME/.dotfiles

# gnome-terminal
sudo apt install -y gnome-terminal
sudo cp -r $DOTPATH/env/gnome-terminal.desktop /usr/share/applications/gnome-terminal.desktop

