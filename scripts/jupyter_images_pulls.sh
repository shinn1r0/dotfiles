#!/bin/zsh

DOTPATH=$HOME/.dotfiles
DOCKER_IMAGES_DIR=$HOME/docker-builds
mkdir -p $DOCKER_IMAGES_DIR >> /dev/null 2>&1

pull_images () {
    echo "pull $1"
    cd $DOCKER_IMAGES_DIR
    if [ ! -d $1 ]; then
        git clone github:shinn1r0/$1
    fi
    cd $1
    git pull
    docker-compose pull
}

echo "pull mode ${1:=gpu}"

if [ $1 = "gpu" ]; then
    pull_images jupyterlab-gpu
elif [ $1 = "cpu" ]; then
    pull_images jupyterlab
fi

docker system prune
