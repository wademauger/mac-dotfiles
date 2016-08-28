# Dont re-arange things
# Path to your oh-my-zsh installation.
export ZSH=/home/dylan/.oh-my-zsh

# oh-my-zsh options
ZSH_THEME="sunrise"
COMPLETION_WAITING_DOTS="true"
DISABLE_UNTRACKED_FILES_DIRTY="true"
plugins=(git)

source $ZSH/oh-my-zsh.sh

# Setup color scheme for `ls`
eval `dircolors ~/.dircolors`

export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"

# make esc more responsize in vim
KEYTIMEOUT=1

# vim key binds
set -o vi

# Ctrl-Z for vim hide/show
foreground-vi() {
  fg %nvim
}

zle -N foreground-vi
bindkey '^Z' foreground-vi

# stop auto cd plz
unsetopt AUTO_CD

# run aliases
source ~/.aliases

# run functions
source ~/.functions

# virtual env
if [ -e /usr/local/bin/virtualenvwrapper.sh ]
then
  export WORKON_HOME=~/Envs
  source /usr/local/bin/virtualenvwrapper.sh
fi

# nvm
if [ -e $HOME/.nvm/nvm.sh ]
then
  unset PREFIX
  export NVM_DIR="$HOME/.nvm"
  [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
fi

[[ ! $TERM =~ "screen" ]] && tmux
