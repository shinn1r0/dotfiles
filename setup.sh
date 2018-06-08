#!/bin/zsh

for f in .??*
do
    [[ "$f" == ".git" ]] && continue

    echo "$f"
    ln -s $HOME/dotfiles/$f $HOME/$f
done

mkdir -p $HOME/.config 2>/dev/null
mkdir -p $HOME/dotfiles/nvim/backup 2>/dev/null
mkdir -p $HOME/.local/bin 2> /dev/null
ln -s $HOME/dotfiles/nvim $HOME/.config/nvim
ln -s $HOME/dotfiles/git $HOME/.config/git
cp -r $HOME/dotfiles/autostart $HOME/.config/autostart
ln -s $HOME/dotfiles/up.sh $HOME/.local/bin/up.sh
git clone git@github.com:shinichir0/conky $HOME/.config/conky
cp $HOME/.config/conky/conky_template.conf $HOME/.config/conky/conky.conf
zcompile ${HOME}/.zshrc
