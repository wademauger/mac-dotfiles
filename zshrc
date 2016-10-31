export ZSH=/Users/wmauger/.oh-my-zsh

ZSH_THEME="powerlevel9k/powerlevel9k"
COMPLETION_WAITING_DOTS="true"
DISABLE_UNTRACKED_FILES_DIRTY="true"
DEFAULT_USER=`whoami`
plugins=(git)
unsetopt AUTO_CD

source $ZSH/oh-my-zsh.sh

export PATH="/usr/local/opt/coreutils/libexec/gnubin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:$HOME/.tmuxifier/bin:$PATH"
export JAVA_HOME="$(/usr/libexec/java_home -v 1.8)"

eval `dircolors ~/.dircolors`

KEYTIMEOUT=1

export VISUAL=vim
export EDITOR="$VISUAL"

foreground-vi() {
  fg %nvim
}

zle -N foreground-vi
bindkey '^Z' foreground-vi

source ~/.aliases
source ~/.functions

if [ -e /usr/local/bin/virtualenvwrapper.sh ]
then
  export WORKON_HOME=~/Envs
  source /usr/local/bin/virtualenvwrapper.sh
fi

if [ -e $HOME/.nvm/nvm.sh ]
then
  unset PREFIX
  export NVM_DIR="$HOME/.nvm"
  [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
fi

BASE16_SHELL=$HOME/.config/base16-shell/
[ -n "$PS1" ] && [ -s $BASE16_SHELL/profile_helper.sh ] && eval "$($BASE16_SHELL/profile_helper.sh)"

# bind -x '"\C-l": clear;"'

[[ ! $TERM =~ "screen" ]] && tmux

tmux source-file ~/.tmux.conf
export PATH="$HOME/.jenv/bin:$PATH"
eval "$(jenv init -)"
eval "$(jenv init -)"

export PATH="$HOME/.yarn/bin:$PATH"
