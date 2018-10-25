#!/bin/zsh

SCRIPT_DIR=$(cd $(dirname $0); pwd)
mkdir -p ${HOME}/kvm-disks
qemu-img create -f qcow2 ${HOME}/kvm-disks/kali-disk.img 100G
kvm --name Kali -m 1024 -hda ${HOME}/kvm-disks/kali-disk.img -cdrom ${SCRIPT_DIR}/images/kali-linux-light-rolling-amd64.iso -boot d
