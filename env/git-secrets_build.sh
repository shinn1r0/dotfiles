#!/bin/zsh

mkdir ${HOME}/.local/share >> /dev/null 2>&1
cd ${HOME}/.local/share
git clone https://github.com/awslabs/git-secrets.git
cd git-secrets/ && sudo make install
#git secrets --register-aws --global
#git secrets --install ~/.git-templates/git-secrets
#git config --global init.templatedir '~/.git-templates/git-secrets'
