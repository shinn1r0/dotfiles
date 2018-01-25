export PATH='/usr/local/texlive/2017/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/cuda/bin:/home/shin-ichiro/.local/bin'
export LD_LIBRARY_PATH='/usr/local/cuda/lib64'
export CUDA_HOME='/usr/local/cuda'
export ZPLUG_HOME=${HOME}/.zplug
export PERCOL='fzf'
export PATH=${HOME}/.nim/bin:$PATH
export PATH=${HOME}/.nodebrew/current/bin:$PATH
export RBENV_ROOT=${HOME}/.rbenv
export PATH=$RBENV_ROOT/bin:$PATH
if command -v rbenv 1>/dev/null 2>&1; then
  eval "$(rbenv init -)"
fi
export PYENV_ROOT=${HOME}/.pyenv
export PATH=$PYENV_ROOT/bin:$PATH
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
  eval "$(pyenv virtualenv-init -)"
fi
export VIRTUAL_ENV_DISABLE_PROMPT=1
