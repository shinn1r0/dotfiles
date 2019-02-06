#!/bin/zsh

# goenv install
if (! type anyenv &> /dev/null); then
    if [ -d "${DOTPATH}" ]; then
        $DOTPATH/env/anyenv.sh
    else
        zsh -c "$(curl -fsSL dots.shinichironaito.com/env/anyenv.sh)"
    fi
fi

anyenv install goenv
exec $SHELL
# golang install
VERSION=$(goenv install -l | grep -E "^ *[0-9]*\.[0-9]*\.[0-9]*$" | sort -V | tail -n 1 | awk '{print $1}')
goenv install ${VERSION}
goenv global ${VERSION}
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
