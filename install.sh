#!/bin/zsh

DOTPATH=$HOME/.dotfiles

if (type git &> /dev/null); then
    git clone https://github.com/shinichir0/dotfiles.git
elif (type curl &> /dev/null) || (type wget &> /dev/null); then
    TARBALL="https://github.com/shinichir0/dotfiles/archive/master.tar.gz"
    if (type curl &> /dev/null); then
        curl -L ${TARBALL}
    elif (type wget &> /dev/null); then
        wget -O - ${TARBALL}
    fi | tar xv -

    mv -f dotfiles-master ${DOTPATH}
else
    exit 1
fi

cd ${DOTPATH}

if [ $? -ne 0 ]; then
    exit 1
fi

for f in .??*
do
    [[ "$f" == ".git" || "$f" == ".gitignore" ]] && continue

    ln -snfv $DOTPATH/$f $HOME/$f
done

mkdir -p $HOME/.config 2>/dev/null
mkdir -p $HOME/.local/bin 2> /dev/null
mkdir -p $HOME/.local/share 2> /dev/null
mkdir -p $HOME/.ssh 2> /dev/null

mkdir -p $DOTPATH/nvim/vimfiles/swap 2>/dev/null
mkdir -p $DOTPATH/nvim/vimfiles/backup 2>/dev/null
mkdir -p $DOTPATH/nvim/vimfiles/undo 2>/dev/null
ln -snfv $DOTPATH/nvim $HOME/.config/nvim
ln -snfv $DOTPATH/scripts/up.sh $HOME/.local/bin/up.sh

zcompile $HOME/.zshenv
zcompile $HOME/.zshrc
