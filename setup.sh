#!/bin/bash

for f in .??*
do
    [[ "$f" == ".git" ]] && continue

    echo "$f"
    ln -s $HOME/dotfiles/$f $HOME/$f
done

mkdir -p $HOME/.config 2>/dev/null
mkdir -p $HOME/dotfiles/nvim/backup 2>/dev/null
ln -s $HOME/dotfiles/nvim $HOME/.config/nvim
cp -r $HOME/dotfiles/conky $HOME/.config/conky
cp -r $HOME/dotfiles/autostart $HOME/.config/autostart
ln -s $HOME/dotfiles/up.sh $HOME/up.sh
