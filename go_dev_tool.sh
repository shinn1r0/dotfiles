if !(type go &> /dev/null); then
    curl -sSO https://dl.google.com/go/go1.10.3.linux-amd64.tar.gz
    tar -xzvf go*.tar.gz -C /usr/local
    rm go*.tar.gz
    exec $SHELL
fi
go get -u golang.org/x/tools/cmd/goimports
go get -u github.com/nsf/gocode
go get -u github.com/rogpeppe/godef
go get -u github.com/derekparker/delve/cmd/dlv
go get -u github.com/golang/dep/cmd/dep

