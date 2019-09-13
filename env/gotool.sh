#!/bin/zsh

if (! type go &> /dev/null); then
    $DOTPATH/env/goenv.sh
fi

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
