#!/bin/zsh

SCRIPT_DIR=$(cd $(dirname $0); pwd)
sudo apt update
sudo apt install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo apt-key fingerprint 0EBFCD88

sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

sudo apt-get install -y docker-ce

sudo adduser ${USER} docker

cd ${SCRIPT_DIR}
git clone https://github.com/docker/compose.git
cd ${SCRIPT_DIR}/compose
VERSION=$(git tag | grep -E "^[0-9]*\.[0-9]*\.[0-9]*$" | sort -V | tail -n 1)
cd ${SCRIPT_DIR}
rm -rf compose

sudo curl -L "https://github.com/docker/compose/releases/download/${VERSION}/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
docker-compose --version

mkdir -p ${HOME}/.zsh/completion
curl -L https://raw.githubusercontent.com/docker/compose/${VERSION}/contrib/completion/zsh/_docker-compose > ${HOME}/.zsh/completion/_docker-compose