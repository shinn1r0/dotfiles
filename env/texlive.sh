#!/bin/zsh

SCRIPT_DIR=$(cd $(dirname $0); pwd)
cd ${SCRIPT_DIR}
curl -LO http://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz
tar xzvf install-tl-unx.tar.gz
rm install-tl-unx.tar.gz

TEXLIVE_DIR=$(ls | grep install-tl)
cd ${SCRIPT_DIR}/${TEXLIVE_DIR}
sudo ./install-tl

VERSION=$(cat release-texlive.txt | head -n 1 | awk '{print $5}')
sudo /usr/local/texlive/${VERSION}/bin/x86_64-linux/tlmgr path add

sudo tlmgr option
sudo tlmgr update --self --all
sudo kanji-config-updmap-sys ipaex
sudo mktexlsr

cd ${SCRIPT_DIR}
sudo rm -r ${TEXLIVE_DIR}
