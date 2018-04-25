# requirements packages
sudo apt install zsh xsel git source-highlight software-properties-common
sudo add-apt-repository ppa:neovim-ppa/stable
sudo add-apt-repository ppa:alessandro-strada/ppa
sudo apt update
sudo apt install unixodbc-dev neovim google-drive-ocamlfuse clamtk

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
pyenv install 2.7.14
pyenv global anaconda3-5.1.0 2.7.14
conda config --append channels conda-forge
rbenv install 2.5.0
rbenv global 2.5.0
nodebrew install-binary v9.9.0
nodebrew use v9.9.0
source ~/.zshenv
source ~/.zshrc

./tmux_build.sh
./nim_build.sh
./trash-cli_build.sh
./ctags_build.sh
pip install Pygments
sudo apt install global

# neovim
pip install neovim
gem install neovim
npm install -g neovim

# terminal
cd ~/
wget https://raw.githubusercontent.com/denysdovhan/gnome-terminal-one/master/one-dark.sh && chmod 744 one-dark.sh && ./one-dark.sh && rm one-dark.sh
git clone https://github.com/powerline/fonts.git --depth=1 && cd fonts && ./install.sh && cd .. & rm -rf fonts
git clone https://github.com/zplug/zplug $ZPLUG_HOME
mkdir -p ~/.tmux/plugins
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install
fc-cache -vf
git clone https://github.com/awslabs/git-secrets.git
cd git-secrets/ && make install && cd ../ && rm -r git-secrets
git secrets --register-aws --global
git secrets --install ~/.git-templates/git-secrets
git config --global init.templatedir '~/.git-templates/git-secrets'
git config --global core.excludesfile ~/.gitignore_global

source ~/.zshrc

google-drive-ocamlfuse
