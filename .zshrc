# Setting===================================================================
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000000
SAVEHIST=1000000
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/nightshinn/.zshrc'

autoload -Uz compinit compinit -u

# Zsh setting===============================================================
setopt auto_cd
function chpwd() { ls --color }
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
tabs -4
alias ...='cd ../..'
alias ....='cd ../../..'
setopt auto_pushd
setopt pushd_ignore_dups
setopt share_history
setopt hist_ignore_all_dups
setopt hist_ignore_space
precmd () {
  echo -ne "\e]2;${PWD}\a"
  echo -ne "\e]1;${PWD:t}\a"
}
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Alias=====================================================================
alias ls='ls --color'
alias la='ls -a'
alias ll='ls -l'
alias l='view'
alias pipu='pip list --outdated --format=legacy | awk '{print $1}' | xargs pip install -U'
alias pipu='pip3 list --outdated --format=legacy | awk '{print $1}' | xargs pip3 install -U'
alias pipup='pip install --upgrade pip'
alias pipup3='pip3 install --upgrade pip'
alias vi='VIM=/usr/share/vim VIMRUNTIME=/usr/share/vim/vim74 vi'
alias vim='nvim'
alias py='python'
alias ipy='ipython'
alias pbcopy='xsel --clipboard --input'
alias pbpaste='xsel --clipboard --output'
alias btup='pactl load-module module-bluetooth-discover'
alias update='~/up.sh'

# Export====================================================================
export NVIM_PYTHON_LOG_FILE=/tmp/log
export NVIM_PYTHON_LOG_LEVEL=DEBUG  
export CLICOLOR=1
export XDG_CONFIG_HOME=${HOME}/.config
export XDG_CACHE_HOME=${HOME}/.cache
export XDG_DATA_HOME=${HOME}/.local/share
export PROMPT='%F{red}%n@%m$%f '
export RPROMPT='%F{red}[%~]%f'
export SHELL=/usr/bin/zsh
export LANG='en_US.UTF-8'
export LC_ALL='en_US.UTF-8'

# Tmux======================================================================
if [[ ! -n $TMUX ]]; then
  # get the IDs
  ID="`tmux list-sessions`"
  if [[ -z "$ID" ]]; then
    tmux new-session
  fi
  create_new_session="Create New Session"
  ID="$ID\n${create_new_session}:"
  ID="`echo $ID | $PERCOL | cut -d: -f1`"
  if [[ "$ID" = "${create_new_session}" ]]; then
    tmux new-session
  elif [[ -n "$ID" ]]; then
    tmux attach-session -t "$ID"
  else
    :  # Start terminal normally
  fi
fi

# Zplug=====================================================================
source ${ZPLUG_HOME}/init.zsh

zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-syntax-highlighting"
zplug "olivierverdier/zsh-git-prompt"
zplug "peco/peco", as:command, from:gh-r, use:"*amd64*"
zplug "b4b4r07/enhancd", use:init.sh

if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi
zplug load
#===========================================================================

