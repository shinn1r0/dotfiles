#!/bin/zsh

sudo apt -y install qemu-kvm libvirt-bin ubuntu-vm-builder bridge-utils
sudo adduser $(id -un) kvm
newgrp kvm
