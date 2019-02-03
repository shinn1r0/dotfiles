#!/bin/bash

SCRIPT_DIR=$(cd $(dirname $0); pwd)
echo "install requirement============================================"
sudo apt -y install git live-build cdebootstrap debootstrap curl

KEYRING_VERSION=$(curl -sS https://http.kali.org/pool/main/k/kali-archive-keyring/ | grep all.deb | awk -F \" '{print $8}')
curl -LO "https://http.kali.org/pool/main/k/kali-archive-keyring/${KEYRING_VERSION}"

LIVEBUILD_VERSION=$(curl -sS https://archive.kali.org/kali/pool/main/l/live-build/ | grep all.deb | grep kali | awk -F \" '{print $2}')
curl -O "https://archive.kali.org/kali/pool/main/l/live-build/${LIVEBUILD_VERSION}"

sudo dpkg -i ${KEYRING_VERSION}
sudo dpkg -i ${LIVEBUILD_VERSION}
rm ${KEYRING_VERSION}
rm ${LIVEBUILD_VERSION}

cd /usr/share/debootstrap/scripts/
(echo 'default_mirror http://http.kali.org/kali'; sed -e 's/debian-archive-keyring.gpg/kali-archive-keyring.gpg/g' sid) | sudo tee kali
sudo ln -snfv kali kali-rolling

echo "cloning repository============================================="
cd ${SCRIPT_DIR}
git clone git://git.kali.org/live-build-config.git build

echo "copy config files=============================================="
if [ -d cfg ]; then
    cp cfg/isolinux.cfg build/kali-config/common/includes.binary/isolinux/
    cp cfg/menu.cfg build/kali-config/common/includes.binary/isolinux/
    cp cfg/live.cfg build/kali-config/common/includes.binary/isolinux/
    cp cfg/zsh.chroot build/kali-config/common/hooks/live/
    cp cfg/0031-root-password build/kali-config/common/includes.chroot/usr/lib/live/config/
    cp cfg/gnome/kali.list.chroot build/kali-config/variant-gnome/package-lists/
fi

echo "change build script============================================"
cd ${SCRIPT_DIR}/build
CHANGE_NUM=$(cat build.sh | grep -n -A 1 "debootstrap" | grep exit | awk -F - '{print $1}')
sed -e "${CHANGE_NUM} s/exit/# exit/g" build.sh | sudo tee build.sh

echo "start build===================================================="
./build.sh --distribution kali-rolling --variant gnome --verbose

echo "move iso======================================================="
mkdir ${SCRIPT_DIR}/images
mv ${SCRIPT_DIR}/build/images/* ${SCRIPT_DIR}/images/
cd ${SCRIPT_DIR}
rm -rf build
