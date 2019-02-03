#!/bin/zsh

cd ${HOME}
INTELLIJIDEA=$(ls -a | grep .IntelliJIdea | sort -V | tail -n 1)
PYCHARM=$(ls -a | grep .PyCharm | sort -V | tail -n 1)
GOLAND=$(ls -a | grep .GoLand | sort -V | tail -n 1)

DOTPATH=${HOME}/.dotfiles
cp ${DOTPATH}/app/vim_settings.xml ${INTELLIJIDEA}/config/options/
cp ${DOTPATH}/app/vim_settings.xml ${PYCHARM}/config/options/
cp ${DOTPATH}/app/vim_settings.xml ${GOLAND}/config/options/
