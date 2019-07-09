#!/bin/zsh

curl -O https://dl.google.com/linux/direct/chrome-remote-desktop_current_amd64.deb
sudo dpkg -i chrome-remote-desktop_current_amd64.deb
rm chrome-remote-desktop_current_amd64.deb
sudo usermod -a -G chrome-remote-desktop $USER
