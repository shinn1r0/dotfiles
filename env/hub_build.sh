#!/bin/zsh

if (! type hub &> /dev/null); then
    if (! type goenv &> /dev/null); then
        if (! type anyenv &> /dev/null); then
            $DOTPATH/env/anyenv.sh
        fi
        $DOTPATH/env/goenv.sh
    fi

    sudo apt install -y make

    mkdir -p "$GOPATH"/src/github.com/github
    git clone \
      --config transfer.fsckobjects=false \
      --config receive.fsckobjects=false \
      --config fetch.fsckobjects=false \
      https://github.com/github/hub.git "$GOPATH"/src/github.com/github/hub
    cd "$GOPATH"/src/github.com/github/hub
    make install prefix=$HOME/.local/bin

    mkdir -p $HOME/.zsh/completions
    cp $GOPATH/src/github.com/github/hub/etc/hub.zsh_completion $HOME/.zsh/completions/_hub
fi
