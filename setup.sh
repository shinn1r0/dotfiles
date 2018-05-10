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
ln -s $HOME/dotfiles/git $HOME/.config/git
cp -r $HOME/dotfiles/autostart $HOME/.config/autostart
ln -s $HOME/dotfiles/up.sh $HOME/.local/bin/up.sh
git clone https://shinichir0@github.com:shinichir0/conky $HOME/.config/conky
zcompile ${HOME}/.zshrc
