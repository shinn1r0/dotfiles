#!/bin/zsh

SCRIPT_DIR=$(cd $(dirname $0); pwd)
kvm --name Kali -m 1024 -hda ${HOME}/kvm-disks/kali-disk.img -cdrom ${SCRIPT_DIR}/images/kali-linux-gnome-rolling-amd64.iso -boot d
