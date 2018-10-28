#!/bin/zsh

http_proxy=socks5://127.0.0.1:9050
https_proxy=$http_proxy
ftp_proxy=$http_proxy
rsync_proxy=$http_proxy
HTTP_PROXY=$http_proxy
HTTPS_PROXY=$http_proxy
FTP_PROXY=$http_proxy
RSYNC_PROXY=$http_proxy
tor &
