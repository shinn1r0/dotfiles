# programming language
sudo apt-get install -y make build-essential libssl-dev zlib1g-dev libbz2-dev \
libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev libncursesw5-dev \
xz-utils tk-dev unixodbc-dev neovim zsh xsel git
git clone https://github.com/pyenv/pyenv.git ~/.pyenv
git clone https://github.com/rbenv/rbenv.git ~/.rbenv
mkdir -p "$(rbenv root)"/plugins
git clone https://github.com/rbenv/ruby-build.git "$(rbenv root)"/plugins/ruby-build
cd ~/ && curl -L git.io/nodebrew | perl - setup
source ~/.zshenv
pyenv install anaconda3-5.0.1
pyenv install 2.7.14
pyenv global anaconda3-5.0.1 2.7.14
conda config --append channels conda-forge
rbenv install 2.5.0
rbenv global 2.5.0
nodebrew install-binary v9.3.0
nodebrew use v9.3.0
source ~/.zshenv
source ~/.zshrc

./tmux_build.sh

# neovim
pip install neovim
gem install neovim
npm install -g neovim

# terminal
wget https://raw.githubusercontent.com/denysdovhan/gnome-terminal-one/master/one-dark.sh && chmod 744 one-dark.sh && ./one-dark.sh && rm one-dark.sh
git clone https://github.com/powerline/fonts.git --depth=1 && cd fonts && ./install.sh && cd .. & rm -rf fonts
git clone https://github.com/zplug/zplug $ZPLUG_HOME
mkdir -p ~/.tmux/plugins
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install
fc-cache -vf
source ~/.zshrc
