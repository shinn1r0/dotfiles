# Profiling=====================================================================
#zmodload zsh/zprof && zprof

# Path==========================================================================
# Global====================================================
export PATH='/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin'

# Home======================================================
export ZPLUG_HOME=${HOME}/.zplug
export TEXLIVE_HOME=/usr/local/texlive/2018
export NIM_HOME=${HOME}/.nimble
export GOPATH=${HOME}/go
export GOBIN=${GOPATH}/bin

# Cuda======================================================
if [ -d /usr/local/cuda ]; then
    export CUDA_HOME='/usr/local/cuda'
    export LD_LIBRARY_PATH=${CUDA_HOME}/lib64:${LD_LIBRARY_PATH}
    export LD_LIBRARY_PATH=${CUDA_HOME}/extras/CUPTI/lib64:${LD_LIBRARY_PATH}
    export CPATH=${CUDA_HOME}/include:${CPATH}
    export PATH=${CUDA_HOME}/bin:${PATH}
fi
if [ -d /usr/local/nccl ]; then
    export NCCL_ROOT='/usr/local/nccl'
    export CPATH=${NCCL_ROOT}/include:${CPATH}
    export LD_LIBRARY_PATH=${NCCL_ROOT}/lib:${LD_LIBRARY_PATH}
    export LIBRARY_PATH=${NCCL_ROOT}/lib:${LIBRARY_PATH}
fi
if [ -d /usr/local/TensorRT ]; then
    export LD_LIBRARY_PATH=/usr/local/TensorRT/lib:${LD_LIBRARY_PATH}
fi

# Google Cloud Platform=====================================
if [ -f "${HOME}/google-cloud-sdk/path.zsh.inc" ]; then
    . "${HOME}/google-cloud-sdk/path.zsh.inc"
fi

# Bin=======================================================
export PATH=${HOME}/.local/bin:${PATH}
export PATH=${TEXLIVE_HOME}/bin:${PATH}
export PATH=${GOBIN}:${PATH}
export PATH=${NIM_HOME}/bin:${PATH}

# Editor========================================================================
export EDITOR=nvim
export PAGER=less
export VIM=/usr/share/nvim
export VIMRUNTIME=/usr/share/nvim/runtime

# Anyenv========================================================================
export ANYENV_ROOT=${HOME}/.anyenv
export PATH=${ANYENV_ROOT}/bin:${PATH}
if command -v anyenv 1>/dev/null 2>&1; then
  eval "$(env PATH="${ANYENV_ROOT}/libexec:${PATH}" ${ANYENV_ROOT}/libexec/anyenv-init - --no-rehash zsh)"
fi
if command -v goenv 1>/dev/null 2>&1; then
export GOROOT="$(goenv root)/versions/$(goenv global)"
fi

# Zcompile==================================================================
if [ ~/.zshenv -nt ~/.zshenv.zwc ]; then
    zcompile ~/.zshenv
fi
#===============================================================================
