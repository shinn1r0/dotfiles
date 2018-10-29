#!/bin/zsh

SCRIPT_DIR=$(cd $(dirname $0); pwd)
sudo apt update
sudo apt install -y\
    build-essential \
    ffmpeg \
    libsdl2-dev \
    libsdl2-image-dev \
    libsdl2-mixer-dev \
    libsdl2-ttf-dev \
    libportmidi-dev \
    libswscale-dev \
    libavformat-dev \
    libavcodec-dev \
    zlib1g-dev \
    libgstreamer1.0 \
    gstreamer1.0-plugins-base \
    gstreamer1.0-plugins-good

echo "Enter Project Name"
read PROJECT_NAME
mkdir -p ${HOME}/PycharmProjects/${PROJECT_NAME}
cd ${HOME}/PycharmProjects/${PROJECT_NAME}
pipenv install Cython
pipenv install kivy
pipenv install -d pytest
