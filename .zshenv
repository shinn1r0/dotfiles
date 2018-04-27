# Profiling=====================================================================
#zmodload zsh/zprof && zprof

# Path==========================================================================
export PATH='/usr/local/texlive/2017/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/cuda/bin:/home/shin-ichiro/.local/bin'
export PATH=${HOME}/.Nim/bin:$PATH
export PATH=${HOME}/.nodebrew/current/bin:$PATH

# Editor========================================================================
export EDITOR=nvim
export VIM=/usr/share/nvim
export VIMRUNTIME=/usr/share/nvim/runtime

# Etc===========================================================================
export ZPLUG_HOME=${HOME}/.zplug
export NIM_HOME=${HOME}/.Nim

# rbenv=========================================================================
export RBENV_ROOT=${HOME}/.rbenv
export PATH=$RBENV_ROOT/bin:$PATH
if command -v rbenv 1>/dev/null 2>&1; then
  eval "$(rbenv init -)"
fi

# pyenv=========================================================================
export PYENV_ROOT=${HOME}/.pyenv
export PATH=$PYENV_ROOT/bin:$PATH
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
  eval "$(pyenv virtualenv-init -)"
fi
export VIRTUAL_ENV_DISABLE_PROMPT=1

#===============================================================================
