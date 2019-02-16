#!/bin/zsh

SCRIPT_DIR=$(cd $(dirname $0); pwd)
cd ${SCRIPT_DIR}
git clone https://github.com/google-cloud-sdk/google-cloud-sdk
cd ${SCRIPT_DIR}/google-cloud-sdk
VERSION=$(git tag | grep -E "^v[0-9]*\.[0-9]*\.[0-9]*$" | sort -V | tail -n 1 | awk -F v '{print $2}')
cd ${SCRIPT_DIR}
rm -rf google-cloud-sdk

FILE="google-cloud-sdk-${VERSION}-linux-x86_64.tar.gz"
URL="https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/${FILE}"
curl -O ${URL}
tar -xzvf ${FILE} -C ${HOME}/
rm ${FILE}
${HOME}/google-cloud-sdk/install.sh
${HOME}/google-cloud-sdk/bin/gcloud init
