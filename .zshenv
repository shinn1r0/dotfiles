# Profiling=====================================================================
#zmodload zsh/zprof && zprof

# Path==========================================================================
export PATH='/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin'

export ZPLUG_HOME=${HOME}/.zplug
export TEXLIVE_HOME=/usr/local/texlive/2018
export GOROOT=/usr/local/go
export NIM_HOME=${HOME}/.nimble
export NODEBREW_HOME=${HOME}/.nodebrew/current

if (type nvcc &> /dev/null); then
    export LD_LIBRARY_PATH='/usr/local/cuda/lib64'
    export CUDA_HOME='/usr/local/cuda'
    export PATH=${CUDA_HOME}/bin:$PATH
fi

export PATH=${HOME}/.local/bin:$PATH
export PATH=${TEXLIVE_HOME}/bin:$PATH
export PATH=${GOROOT}/bin:$PATH
export PATH=${NIM_HOME}/bin:$PATH
export PATH=${NODEBREW_HOME}/bin:$PATH

# Editor========================================================================
export EDITOR=nvim
export PAGER=less
export VIM=/usr/share/nvim
export VIMRUNTIME=/usr/share/nvim/runtime

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
#export VIRTUAL_ENV_DISABLE_PROMPT=1
#export PIPENV_VENV_IN_PROJECT=true

#===============================================================================
