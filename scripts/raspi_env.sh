#!/bin/zsh

DOTPATH=$HOME/.dotfiles
# apt packages
# necessary packages
sudo apt install -y zsh neovim tmux xsel git tree curl wget source-highlight ctags global software-properties-common
# build packages
sudo apt install -y checkinstall make build-essential llvm
# font packages
sudo apt install -y fonts-noto-cjk-extra fonts-noto-color-emoji fonts-noto-mono fonts-font-awesome

# programming language
if (! type anyenv &> /dev/null); then
    $DOTPATH/env/anyenv.sh
    $DOTPATH/env/pyenv.sh
    $DOTPATH/env/goenv.sh
    #$DOTPATH/env/rbenv.sh
    #$DOTPATH/env/nodenv.sh
fi

if (! type trash-put &> /dev/null); then
    $DOTPATH/env/trash-cli_build.sh
fi
if (! type git-secrets &> /dev/null); then
    $DOTPATH/env/git-secrets_build.sh
fi
if (! type hub &> /dev/null); then
    $DOTPATH/env/hub_build.sh
fi
if (! type stack &> /dev/null); then
    $DOTPATH/env/stack.sh
fi
if (! type choosenim &> /dev/null); then
    cd ~/ && curl https://nim-lang.org/choosenim/init.sh -sSf | sh
fi
#if [ ! -d ${HOME}/google-cloud-sdk ]; then
    #$DOTPATH/env/gcp-sdk.sh
#fi
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
    git clone https://github.com/zplug/zplug ${HOME}/.zplug
fi

## tmux plugins
mkdir -p ~/.tmux/plugins
if [ ! -d ${HOME}/.tmux/plugins/tpm ]; then
    git clone https://github.com/tmux-plugins/tpm ${HOME}/.tmux/plugins/tpm
fi

## fzf
if [ ! -d ${HOME}/.fzf ]; then
    git clone --depth 1 https://github.com/junegunn/fzf.git ${HOME}/.fzf
    ${HOME}/.fzf/install
fi

exec $SHELL -l
cd ${HOME}
