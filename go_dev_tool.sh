# go install
if !(type go &> /dev/null); then
    curl -sSO https://dl.google.com/go/go1.10.3.linux-amd64.tar.gz
    tar -xzvf go*.tar.gz -C /usr/local
    rm go*.tar.gz
    exec $SHELL
fi

# dependency management tool
go get -u github.com/golang/dep/cmd/dep

# linter & format
go get -u golang.org/x/tools/cmd/goimports
go get -u golang.org/x/lint/golint
go get -u github.com/kisielk/errcheck

# atom-editor
## debugger
go get -u github.com/derekparker/delve/cmd/dlv
## autocompletion daemon
go get -u github.com/nsf/gocode
## print where symbols are defined
go get -u github.com/rogpeppe/godef
