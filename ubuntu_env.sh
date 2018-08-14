#!/bin/zsh

# apt packages
# necessary packages
sudo apt install zsh neovim tmux xsel git tree curl wget source-highlight ctags global \
    software-properties-common unixodbc-dev clamtk papirus-icon-theme calibre snapd
# build packages
sudo apt install checkinstall make build-essential llvm 
# gnome utility packages
sudo apt install exfat-utils exfat-fuse ntfs-3g gnome-disk-utility gparted
# font packages
sudo apt install fonts-noto-cjk-extra fonts-noto-color-emoji fonts-noto-mono fonts-font-awesome
# conky packages
sudo apt install hddtemp lm-sensors
# google drive packages
sudo add-apt-repository ppa:alessandro-strada/ppa
mkdir ~/GoogleDrive
sudo apt install google-drive-ocamlfuse

# programming language
~/dotfiles/env/anyenv.sh
~/dotfiles/env/pyenv.sh
~/dotfiles/env/goenv.sh
~/dotfiles/env/rbenv.sh
~/dotfiles/env/ndenv.sh

~/dotfiles/env/trash-cli_build.sh
~/dotfiles/env/git-secrets_build.sh
cd ~/ && curl https://nim-lang.org/choosenim/init.sh -sSf | sh

# terminal
cd ~/
## powerline font
git clone https://github.com/powerline/fonts.git --depth=1 && cd fonts && ./install.sh && cd .. & rm -rf fonts
## zplug
git clone https://github.com/zplug/zplug ~/.zplug
## tmux plugins
mkdir -p ~/.tmux/plugins
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
## fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install
## font
fc-cache -vf

source ~/.zshrc

google-drive-ocamlfuse
