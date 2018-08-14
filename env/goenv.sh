#!/bin/zsh

# goenv install
anyenv install goenv
source $HOME/.zshenv
# golang install
goenv install 1.10.3
goenv global 1.10.3
goenv rehash
# golang dev tool
## dependency management tool
go get -u github.com/golang/dep/cmd/dep

## linter & format
go get -u golang.org/x/tools/cmd/goimports
go get -u golang.org/x/lint/golint
go get -u github.com/kisielk/errcheck

## atom-editor
### debugger
go get -u github.com/derekparker/delve/cmd/dlv
### autocompletion daemon
go get -u github.com/nsf/gocode
### print where symbols are defined
go get -u github.com/rogpeppe/godef
