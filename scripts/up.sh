#!/usr/bin/zsh

# update dotfiles
sudo echo "dotfiles update==========================================="
DOTPATH=$HOME/.dotfiles
cd ${DOTPATH} && git pull && cd ${HOME}

# update apt packages
if (type apt &> /dev/null); then
    echo "apt packages update========================================="
    sudo apt update
    sudo apt upgrade -y
    #sudo apt full-upgrade -y
    sudo apt autoremove -y
    sudo apt autoclean -y
fi

# update atom packages
if (type apm &> /dev/null); then
    echo "atom packages update==========================================="
    apm upgrade -c false
    apm list -bi --no-dev > ${DOTPATH}/app/Apmfile_tmp
    if diff -q ${DOTPATH}/app/Apmfile ${DOTPATH}/app/Apmfile_tmp 2> /dev/null; then
        rm ${DOTPATH}/app/Apmfile_tmp
    else
        rm ${DOTPATH}/app/Apmfile
        mv ${DOTPATH}/app/Apmfile_tmp ${DOTPATH}/app/Apmfile
        cd ${DOTPATH} && git add ${DOTPATH}/app/Apmfile && git commit -m 'update' && git push
    fi
fi

# update gcloud components
if (type gcloud &> /dev/null); then
    echo "gcloud components update======================================="
    gcloud components update
fi

# update anyenv
if (type anyenv &> /dev/null); then
    echo "anyenv update=================================================="
    anyenv update
    pyenv rehash
    goenv rehash
    #rbenv rehash
    #nodenv rehash
fi

# update pip packages
if (type pip &> /dev/null); then
    echo "pip packages update============================================"
    has_conda=$(pyenv version | grep conda | wc -l)
    if [ ${has_conda} = 1 ]; then
        pip install -U pip setuptools pipenv kaggle
        conda update --all -y
        conda clean --all -y
    else
        pip list --outdated --format=columns | tail -n +3 | awk '{print $1}' | xargs pip install -U 2>/dev/null || echo "No pip Packages to Update"
    fi
    #pip check
fi

# docker system prune
if (type docker &> /dev/null); then
    docker system prune -f
fi

# update gem packages
#if (type gem &> /dev/null); then
    #echo "gem packages update============================================"
    #gem update --system
    #gem update `gem list | cut -d ' ' -f 1`
#fi

# update npm packages
#if (type npm &> /dev/null); then
    #echo "npm packages update============================================"
    #npm update -g npm
    #npm update -g
#fi

# update go packages
#if (type go &> /dev/null); then
    #echo "go packages update============================================="
    #go get -u github.com/golang/dep/cmd/dep
    #go get -u golang.org/x/tools/cmd/goimports
    #go get -u golang.org/x/lint/golint
    #go get -u github.com/kisielk/errcheck
    #go get -u github.com/derekparker/delve/cmd/dlv
    #go get -u github.com/nsf/gocode
    #go get -u github.com/rogpeppe/godef
#fi

# update nimble packages
#if (type choosenim &> /dev/null); then
    #echo "nimble packages update========================================="
    #choosenim update self
    #choosenim update stable
    #nimble refresh
#fi

# update texlive packages
#if (type tlmgr &> /dev/null); then
    #echo "texlive packages update========================================"
    #sudo tlmgr update --self --all
#fi

# update snap packages
#if (type snap &> /dev/null); then
    #echo "snap packages update==========================================="
    #sudo snap refresh
#fi
