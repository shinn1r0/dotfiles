#!/bin/zsh

INTELLIJIDEA=$(ls -a ${HOME} | grep .IntelliJIdea | sort -V | tail -n 1)
PYCHARM=$(ls -a ${HOME} | grep .PyCharm | sort -V | tail -n 1)
GOLAND=$(ls -a ${HOME} | grep .GoLand | sort -V | tail -n 1)

DOTPATH=${HOME}/.dotfiles
if [ -n "${INTELLIJIDEA}" ]; then
    cp ${DOTPATH}/app/vim_settings.xml ${HOME}/${INTELLIJIDEA}/config/options/vim_settings.xml
fi
if [ -n "${PYCHARM}" ]; then
    cp ${DOTPATH}/app/vim_settings.xml ${HOME}/${PYCHARM}/config/options/vim_settings.xml
fi
if [ -n "${GOLAND}" ]; then
    cp ${DOTPATH}/app/vim_settings.xml ${HOME}/${GOLAND}/config/options/vim_settings.xml
fi
