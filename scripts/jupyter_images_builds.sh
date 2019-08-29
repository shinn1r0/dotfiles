#!/bin/zsh

DOTPATH=$HOME/.dotfiles
DOCKER_IMAGES_DIR=$HOME/docker-builds
mkdir -p $DOCKER_IMAGES_DIR >> /dev/null 2>&1

build_images () {
    echo "build $1 $2"
    cd $DOCKER_IMAGES_DIR
    if [ ! -d $1 ]; then
        git clone github:shinn1r0/$1
    fi
    cd $1
    git pull
    if [ $2 = "cache" ]; then
        docker-compose build
        docker-compose push
    elif [ $2 = "no-cache" ]; then
        docker-compose build --no-cache
        docker-compose push
    fi
}

echo "build mode ${1:=gpu} ${2:=cache}"

if [ $1 = "gpu" ]; then
    build_images jupyterlab-gpu $2
elif [ $1 = "cpu" ]; then
    build_images jupyterlab $2
elif [ $1 = "all" ]; then
    build_images jupyterlab-gpu $2
    build_images jupyterlab $2
fi

docker system prune -f
