#!/bin/zsh

DOTPATH=$HOME/.dotfiles
DOCKER_IMAGES_DIR=$HOME/docker-builds
mkdir -p $DOCKER_IMAGES_DIR >> /dev/null 2>&1

build_images () {
    echo "build $1"
    cd $DOCKER_IMAGES_DIR
    if [ ! -d $1 ]; then
        git clone github:shinn1r0/$1
    fi
    cd $1
    git pull
    docker-compose build --no-cache
    docker-compose push
}

echo "build mode ${1:=gpu}"

if [ $1 = "gpu" ]; then
    build_images jupyterlab-gpu
elif [ $1 = "cpu" ]; then
    build_images jupyterlab
elif [ $1 = "all" ]; then
    build_images jupyterlab
    build_images jupyterlab-gpu
fi
