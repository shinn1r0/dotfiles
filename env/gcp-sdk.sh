echo "input gcloud versions(e.g.: 218.0.0)"
read VERSION
FILE="google-cloud-sdk-${VERSION}-linux-x86_64.tar.gz"
URL="https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/${FILE}"
curl -O ${URL}
tar -xzvf ${FILE} -C ${HOME}/
rm ${FILE}
${HOME}/google-cloud-sdk/install.sh
${HOME}/google-cloud-sdk/bin/gcloud init
exec $SHELL -l
gcloud components update
