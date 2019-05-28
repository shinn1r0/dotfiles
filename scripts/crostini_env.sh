#!/bin/zsh

DOTPATH=$HOME/.dotfiles

# apt packages
# necessary packages
#sudo apt install neovim tmux
sudo apt install -y zsh vim xsel git tree curl wget source-highlight ctags global software-properties-common ncdu
# build packages
sudo apt install -y checkinstall make build-essential llvm
# gnome utility packages
sudo apt install -y exfat-utils exfat-fuse ntfs-3g gnome-disk-utility gparted
# font packages
sudo apt install -y fonts-noto-cjk fonts-noto-mono fonts-font-awesome

# programming language
if (! type anyenv &> /dev/null); then
    $DOTPATH/env/anyenv.sh
    exec $SHELL -l
    anyenv install --init
    $DOTPATH/env/crostini-pyenv.sh
    $DOTPATH/env/goenv.sh
    $DOTPATH/env/nodenv.sh
    #$DOTPATH/env/rbenv.sh
    if (type conda &> /dev/null); then
        if (type node &> /dev/null); then
            $DOTPATH/env/jupyter.sh
        fi
    fi
fi

# build packages
$DOTPATH/env/tmux_build.sh
$DOTPATH/env/neovim_build.sh
if (! type trash-put &> /dev/null); then
    $DOTPATH/env/trash-cli_build.sh
fi
if (! type git-secrets &> /dev/null); then
    $DOTPATH/env/git-secrets_build.sh
fi
#if (! type stack &> /dev/null); then
    #$DOTPATH/env/stack.sh
#fi
if (! type choosenim &> /dev/null); then
    cd ~/ && curl https://nim-lang.org/choosenim/init.sh -sSf | sh
fi
if [ ! -d ${HOME}/google-cloud-sdk ]; then
    $DOTPATH/env/gcp-sdk.sh
fi
if [ ! -f ${HOME}/.ssh/github_rsa ]; then
    $DOTPATH/env/github_ssh.sh
fi

# terminal
cd ${HOME}
## font
## powerline font
if [ $(fc-list | grep Powerline | wc -l) -eq 0 ]; then
    git clone https://github.com/powerline/fonts.git --depth=1 && cd fonts && ./install.sh && cd .. & rm -rf fonts
    fc-cache -vf
fi
## zplug
if [ ! -d ${HOME}/.zplug ]; then
    git clone https://github.com/zplug/zplug ~/.zplug
fi
## tmux plugins
mkdir -p ~/.tmux/plugins
if [ ! -d ${HOME}/.tmux/plugins/tpm ]; then
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi
## fzf
if [ ! -d ${HOME}/.fzf ]; then
    git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
    ~/.fzf/install
fi

exec $SHELL -l
cd ${HOME}
