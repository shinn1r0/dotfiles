#!/bin/zsh

DOTPATH=$HOME/.dotfiles
KALI_IMAGES_DIR=$HOME/kali-images
mkdir -p $KALI_IMAGES_DIR >> /dev/null 2>&1

KALI_WEEKLY="http://cdimage.kali.org/kali-weekly/"
KALI_IMAGE_REGEX="kali-linux-[0-9]{4}-W[0-9]{2}-amd64.iso"

get_image () {
    KALI_IMAGE_NAME=$(curl -sSL $KALI_WEEKLY | grep -E $KALI_IMAGE_REGEX | awk -F '["]' '{print $8}')
    echo "get $KALI_IMAGE_NAME"
    rm -rf $KALI_IMAGES_DIR/*
    cd $KALI_IMAGES_DIR
    curl -sSOL ${KALI_WEEKLY}${KALI_IMAGE_NAME}
}

get_image
