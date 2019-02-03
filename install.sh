#!/bin/zsh

DOTPATH=$HOME/.dotfiles
for f in .??*
do
    [[ "$f" == ".git" || "$f" == ".gitignore" ]] && continue

    ln -sfv $DOTPATH/$f $HOME/$f
done

mkdir -p $HOME/.config 2>/dev/null
mkdir -p $HOME/.local/bin 2> /dev/null
mkdir -p $HOME/.local/share 2> /dev/null
mkdir -p $HOME/.ssh 2> /dev/null

mkdir -p $DOTPATH/nvim/vimfiles/swap 2>/dev/null
mkdir -p $DOTPATH/nvim/vimfiles/backup 2>/dev/null
mkdir -p $DOTPATH/nvim/vimfiles/undo 2>/dev/null
ln -sfv $DOTPATH/nvim $HOME/.config/nvim
ln -sfv $DOTPATH/scripts/up.sh $HOME/.local/bin/up.sh

zcompile $HOME/.zshenv
zcompile $HOME/.zshrc
