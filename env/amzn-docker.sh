#!/bin/zsh

SCRIPT_DIR=$(cd $(dirname $0); pwd)
# install docker stable version=================================================
sudo yum remove docker \
    docker-client \
    docker-client-latest \
    docker-common \
    docker-latest \
    docker-latest-logrotate \
    docker-logrotate \
    docker-engine

sudo yum install -y yum-utils \
    device-mapper-persistent-data \
    lvm2

sudo yum-config-manager \
    --add-repo \
    https://download.docker.com/linux/centos/docker-ce.repo

sudo yum install docker-ce docker-ce-cli containerd.io

sudo systemctl start docker

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
