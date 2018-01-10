#!/bin/bash

for f in .??*
do
    [[ "$f" == ".git" ]] && continue

    echo "$f"
    ln -s $HOME/dotfiles/$f $HOME/$f
done

mkdir -p $HOME/.config 2>/dev/null
mkdir -p $HOME/dotfiles/nvim/backup 2>/dev/null
ln -s nvim $HOME/.config/
ln -s conky $HOME/.config/
ln -s up.sh $HOME/up.sh
