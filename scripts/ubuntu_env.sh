#!/bin/zsh

DOTPATH=$HOME/.dotfiles
# apt packages
# necessary packages
sudo apt install -y zsh neovim tmux xsel git tree curl wget source-highlight ctags global \
    software-properties-common clamtk papirus-icon-theme calibre snapd
# build packages
sudo apt install -y checkinstall make build-essential llvm
# gnome utility packages
sudo apt install -y exfat-utils exfat-fuse ntfs-3g gnome-disk-utility gparted
# font packages
sudo apt install -y fonts-noto-cjk-extra fonts-noto-color-emoji fonts-noto-mono fonts-font-awesome

# google drive packages
sudo add-apt-repository ppa:alessandro-strada/ppa
mkdir ~/GoogleDrive >> /dev/null 2>&1
sudo apt install -y google-drive-ocamlfuse
cp -r $DOTPATH/autostart $HOME/.config/autostart

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
if (! type git-secrets-put &> /dev/null); then
    $DOTPATH/env/git-secrets_build.sh
fi

$DOTPATH/env/stack.sh
cd ~/ && curl https://nim-lang.org/choosenim/init.sh -sSf | sh

$DOTPATH/env/gcp-sdk.sh
$DOTPATH/env/github_ssh.sh

# terminal
cd ${HOME}

## font
## powerline font
git clone https://github.com/powerline/fonts.git --depth=1 && cd fonts && ./install.sh && cd .. & rm -rf fonts
fc-cache -vf

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

google-drive-ocamlfuse
exec $SHELL -l
