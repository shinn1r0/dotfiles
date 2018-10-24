#!/bin/zsh

for f in .??*
do
    [[ "$f" == ".git" || "$f" == ".gitignore" ]] && continue

    echo "$f"
    ln -s $HOME/dotfiles/$f $HOME/$f
done

mkdir -p $HOME/dotfiles/nvim/vimfiles/swap 2>/dev/null
mkdir -p $HOME/dotfiles/nvim/vimfiles/backup 2>/dev/null
mkdir -p $HOME/dotfiles/nvim/vimfiles/undodir 2>/dev/null
mkdir -p $HOME/.config 2>/dev/null
mkdir -p $HOME/.local/bin 2> /dev/null
mkdir -p $HOME/.local/share 2> /dev/null
mkdir -p $HOME/.ssh 2> /dev/null
cp -r $HOME/dotfiles/ssh/config $HOME/.ssh/config
ln -s $HOME/dotfiles/nvim $HOME/.config/nvim
ln -s $HOME/dotfiles/git $HOME/.config/git
ln -s $HOME/dotfiles/up.sh $HOME/.local/bin/up.sh
sudo cp -r $HOME/dotfiles/crostini/gnome-terminal.desktop /usr/share/applications/gnome-terminal.desktop
zcompile ${HOME}/.zshenv
zcompile ${HOME}/.zshrc
