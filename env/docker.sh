#!/bin/zsh

SCRIPT_DIR=$(cd $(dirname $0); pwd)
# install docker stable version=================================================
sudo apt-get remove docker docker-engine docker.io containerd runc
sudo apt-get update
sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo apt-key fingerprint 0EBFCD88

sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io

sudo adduser ${USER} docker

# install docker-compose latest version=========================================
cd ${SCRIPT_DIR}
git clone https://github.com/docker/compose.git
cd ${SCRIPT_DIR}/compose
VERSION=$(git tag | grep -E "^[0-9]*\.[0-9]*\.[0-9]*$" | sort -V | tail -n 1)
cd ${SCRIPT_DIR}
rm -rf compose

sudo curl -L "https://github.com/docker/compose/releases/download/${VERSION}/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
docker-compose --version

if [ -f "${HOME}/.zshrc" ]; then
    mkdir -p ${HOME}/.zsh/completion
    curl -L https://raw.githubusercontent.com/docker/compose/${VERSION}/contrib/completion/zsh/_docker-compose > ${HOME}/.zsh/completion/_docker-compose
fi

if (! type docker-slim &> /dev/null); then
    $DOTPATH/env/docker-slim.sh
fi
