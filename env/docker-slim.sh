#!/bin/zsh

SCRIPT_DIR=$(cd $(dirname $0); pwd)
# install docker-slim version===================================================
cd ${SCRIPT_DIR}
git clone https://github.com/docker-slim/docker-slim.git
cd ${SCRIPT_DIR}/docker-slim
VERSION=$(git tag | grep -E "^[0-9]*\.[0-9]*\.[0-9]*$" | sort -V | tail -n 1)
cd ${SCRIPT_DIR}
rm -rf docker-slim

curl -OL "https://downloads.dockerslim.com/releases/${VERSION}/dist_linux.tar.gz"
tar xzf dist_linux.tar.gz
rm dist_linux.tar.gz
cd ${SCRIPT_DIR}/dist_linux
sudo mv * /usr/local/bin/
cd ${SCRIPT_DIR}
rmdir dist_linux
docker-slim version
