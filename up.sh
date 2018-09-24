#!/usr/bin/zsh

# update dotfiles
sudo echo "dotfiles update==========================================="
cd ${HOME}/dotfiles && git pull && cd ${HOME}

# update ubuntu packages
echo "ubuntu packages update========================================="
sudo apt update
sudo apt upgrade -y
sudo apt full-upgrade -y
sudo apt autoremove -y
sudo apt autoclean -y

# update snap packages
echo "snap packages update==========================================="
sudo snap refresh

# update atom packages
echo "atom packages update==========================================="
apm upgrade -c false
apm list -bi --no-dev > $HOME/dotfiles/app/Apmfile_tmp
if diff -q $HOME/dotfiles/app/Apmfile $HOME/dotfiles/app/Apmfile_tmp 2> /dev/null; then
    rm $HOME/dotfiles/app/Apmfile_tmp
else
    rm $HOME/dotfiles/app/Apmfile
    mv $HOME/dotfiles/app/Apmfile_tmp $HOME/dotfiles/app/Apmfile
    cd $HOME/dotfiles && git add $HOME/dotfiles/app/Apmfile && git commit -m 'update' && git push && cd $HOME
fi

# update texlive packages
echo "texlive packages update========================================"
sudo tlmgr update --self --all

# update anyenv
echo "anyenv update=================================================="
anyenv update
pyenv rehash
goenv rehash
rbenv rehash
nodenv rehash

# update pip packages
echo "pip packages update============================================"
pip list --outdated --format=columns | tail -n +3 | awk '{print $1}' | xargs pip install -U 2>/dev/null || echo "No Packages to Update"
#pip check

# update gem packages
#echo "gem packages update============================================"
#gem update --system
#gem update `gem list | cut -d ' ' -f 1`

# update npm packages
#echo "npm packages update============================================"
#npm update -g npm
#npm update -g

# update go packages
#echo "go packages update============================================="
#go get -u github.com/golang/dep/cmd/dep
#go get -u golang.org/x/tools/cmd/goimports
#go get -u golang.org/x/lint/golint
#go get -u github.com/kisielk/errcheck
#go get -u github.com/derekparker/delve/cmd/dlv
#go get -u github.com/nsf/gocode
#go get -u github.com/rogpeppe/godef

# update nimble packages
#echo "nimble packages update========================================="
#choosenim update self
#choosenim update stable
#nimble refresh
