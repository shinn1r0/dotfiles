# requirements packages
sudo apt install zsh tmux xsel git source-highlight software-properties-common \
    unixodbc-dev neovim clamtk tree ctags global papirus-icon-theme calibre checkinstall
sudo add-apt-repository ppa:alessandro-strada/ppa
sudo apt install google-drive-ocamlfuse
sudo apt install exfat-utils exfat-fuse ntfs-3g gnome-disk-utility gparted snapd
sudo apt install fonts-noto-cjk-extra fonts-noto-color-emoji fonts-noto-mono fonts-font-awesome
sudo apt install hddtemp lmsensors

# pyenv requirements
sudo apt install -y make build-essential libssl-dev zlib1g-dev libbz2-dev \
libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev libncursesw5-dev \
xz-utils tk-dev
# programming language
git clone https://github.com/pyenv/pyenv.git ~/.pyenv
git clone https://github.com/pyenv/pyenv-virtualenv.git $(pyenv root)/plugins/pyenv-virtualenv
git clone https://github.com/rbenv/rbenv.git ~/.rbenv
mkdir -p "$(rbenv root)"/plugins
git clone https://github.com/rbenv/ruby-build.git "$(rbenv root)"/plugins/ruby-build
cd ~/ && curl -L git.io/nodebrew | perl - setup
source ~/.zshenv
pyenv install anaconda3-5.1.0
pyenv install 3.6.5
pyenv install 2.7.15
pyenv global anaconda3-5.1.0 2.7.15
conda config --append channels conda-forge
rbenv install 2.5.0
rbenv global 2.5.0
nodebrew install-binary v9.9.0
nodebrew use v9.9.0
source ~/.zshenv
source ~/.zshrc

~/dotfiles/nim_build.sh
~/dotfiles/trash-cli_build.sh
pip install Pygments

# neovim
pip install neovim
gem install neovim
npm install -g neovim

# terminal
cd ~/
## one dark
wget https://raw.githubusercontent.com/denysdovhan/gnome-terminal-one/master/one-dark.sh && chmod 744 one-dark.sh && ./one-dark.sh && rm one-dark.sh
## powerline font
git clone https://github.com/powerline/fonts.git --depth=1 && cd fonts && ./install.sh && cd .. & rm -rf fonts
## zplug
git clone https://github.com/zplug/zplug $ZPLUG_HOME
## tmux plugins
mkdir -p ~/.tmux/plugins
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
## fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install
## font
fc-cache -vf

source ~/.zshrc

apm install --packages-file $HOME/dotfiles/app/Apmfile
google-drive-ocamlfuse
