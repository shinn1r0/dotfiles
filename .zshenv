# Profiling=====================================================================
#zmodload zsh/zprof && zprof

# Path==========================================================================
# Global====================================================
export PATH='/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin'

# Home======================================================
export ZPLUG_HOME=${HOME}/.zplug
export TEXLIVE_HOME=/usr/local/texlive/2018
export GOPATH=${HOME}/go
export GOBIN=${GOPATH}/bin
export NIM_HOME=${HOME}/.nimble

# Cuda======================================================
if (type nvcc &> /dev/null); then
    export LD_LIBRARY_PATH='/usr/local/cuda/lib64'
    export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/cuda/extras/CUPTI/lib64
    export CUDA_HOME='/usr/local/cuda'
    export PATH=${CUDA_HOME}/bin:$PATH
fi

# Bin=======================================================
export PATH=${HOME}/.local/bin:$PATH
export PATH=${TEXLIVE_HOME}/bin:$PATH
export PATH=${GOBIN}:$PATH
export PATH=${NIM_HOME}/bin:$PATH

# Editor========================================================================
export EDITOR=nvim
export PAGER=less
export VIM=/usr/share/nvim
export VIMRUNTIME=/usr/share/nvim/runtime

# Anyenv========================================================================
export ANYENV_ROOT="$HOME/.anyenv"
export PATH="$ANYENV_ROOT/bin:$PATH"
if command -v anyenv 1>/dev/null 2>&1; then
  eval "$(env PATH="$ANYENV_ROOT/libexec:$PATH" $ANYENV_ROOT/libexec/anyenv-init - --no-rehash zsh)"
fi
if command -v goenv 1>/dev/null 2>&1; then
export GOROOT="$(goenv root)/versions/$(goenv version | awk '{print $1}')"
fi

# Zcompile==================================================================
if [ ~/.zshenv -nt ~/.zshenv.zwc ]; then
    zcompile ~/.zshenv
fi
#===============================================================================
