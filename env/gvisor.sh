#!/bin/zsh

SCRIPT_DIR=$(cd $(dirname $0); pwd)

wget https://storage.googleapis.com/gvisor/releases/nightly/latest/runsc
wget https://storage.googleapis.com/gvisor/releases/nightly/latest/runsc.sha512
sha512sum -c runsc.sha512
chmod a+x runsc
sudo mv runsc /usr/local/bin
rm runsc.sha512

sudo cp $DOTPATH/env/crostini-gvisor.json /etc/docker/daemon.json
