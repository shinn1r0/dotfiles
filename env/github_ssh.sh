#!/bin/zsh

sudo apt update && sudo apt install -y gconf2
cd $HOME/.ssh
ssh-keygen -t rsa -f github_rsa
chmod 600 github_rsa
xsel --clipboard --input < ~/.ssh/github_rsa.pub
cat ~/.ssh/github_rsa.pub
rm ~/.ssh/github_rsa.pub
cat $DOTPATH/.ssh/config >> $HOME/.ssh/config
