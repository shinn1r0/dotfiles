#!/bin/zsh

# anyenv requirements
sudo apt install -y libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev libncurses5-dev libncursesw5-dev xz-utils tk-dev
# anyenv clone
git clone https://github.com/riywo/anyenv ~/.anyenv
source ~/.zshenv
# anyenv-update
mkdir -p $(anyenv root)/plugins
git clone https://github.com/znz/anyenv-update.git $(anyenv root)/plugins/anyenv-update