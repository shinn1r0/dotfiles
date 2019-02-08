#!/bin/zsh

SCRIPT_DIR=$(cd $(dirname $0); pwd)
DOTPATH=$HOME/.dotfiles

if (! type docker &> /dev/null); then
    dist=$(. /etc/os-release;echo $ID)
    if ( $dist = "ubuntu" ); then
        if [ -d "${DOTPATH}" ]; then
            $DOTPATH/env/docker.sh
        else
            zsh -c "$(curl -fsSL dots.shinichironaito.com/env/docker.sh)"
        fi
    elif ( $dist = "debian" ); then
        if [ -d "${DOTPATH}" ]; then
            $DOTPATH/env/crostini-docker.sh
        else
            zsh -c "$(curl -fsSL dots.shinichironaito.com/env/crostini-docker.sh)"
        fi
    elif ( $dist = "centos" ); then
        if [ -d "${DOTPATH}" ]; then
            $DOTPATH/env/al2-docker.sh
        else
            zsh -c "$(curl -fsSL dots.shinichironaito.com/env/al2-docker.sh)"
        fi
    fi
fi

# install nvidia-docker version=================================================
curl -s -L https://nvidia.github.io/nvidia-docker/gpgkey | \
  sudo apt-key add -
distribution=$(. /etc/os-release;echo $ID$VERSION_ID)
curl -s -L https://nvidia.github.io/nvidia-docker/$distribution/nvidia-docker.list | \
  sudo tee /etc/apt/sources.list.d/nvidia-docker.list
sudo apt-get update
sudo apt-get install -y nvidia-docker2
sudo pkill -SIGHUP dockerd

docker run --runtime=nvidia --rm nvidia/cuda:9.0-base nvidia-smi
