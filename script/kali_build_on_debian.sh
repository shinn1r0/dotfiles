sudo apt -y install git live-build cdebootstrap debootstrap curl

KEYRING_VERSION=$(curl -sS https://http.kali.org/pool/main/k/kali-archive-keyring/ | grep all.deb | awk -F \" '{print $8}')
curl -O "https://http.kali.org/pool/main/k/kali-archive-keyring/${KEYRING_VERSION}"

LIVEBUILD_VERSION=$(curl -sS https://archive.kali.org/kali/pool/main/l/live-build/ | grep all.deb | grep kali | awk -F \" '{print $2}')
curl -O "https://archive.kali.org/kali/pool/main/l/live-build/${LIVEBUILD_VERSION}"

sudo dpkg -i ${KEYRING_VERSION}
sudo dpkg -i ${LIVEBUILD_VERSION}


