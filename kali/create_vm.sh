#!/bin/zsh

SCRIPT_DIR=$(cd $(dirname $0); pwd)
mkdir -p ${HOME}/kvm-disks
qemu-img create -f qcow2 ${HOME}/kvm-disks/kali-disk.img 100G
