export ZSH=/Users/wadeanthony/.oh-my-zsh
export TERM="xterm-256color"

export LANG="en_US.UTF-8"
export LC_COLLATE="en_US.UTF-8"
export LC_CTYPE="en_US.UTF-8"
export LC_MESSAGES="en_US.UTF-8"
export LC_MONETARY="en_US.UTF-8"
export LC_NUMERIC="en_US.UTF-8"
export LC_TIME="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"

ZSH_THEME="powerlevel9k/powerlevel9k"
COMPLETION_WAITING_DOTS="true"
DISABLE_UNTRACKED_FILES_DIRTY="true"
DEFAULT_USER=`whoami`
plugins=(git)
unsetopt AUTO_CD

source $ZSH/oh-my-zsh.sh

export PATH="/usr/local/opt/coreutils/libexec/gnubin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:$HOME/.tmuxifier/bin:$PATH"

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

if ! { [ "$TMUX" != "" ]; } then
  tmux
fi

tmux source-file ~/.tmux.conf
export PATH="$HOME/.jenv/bin:$PATH"
eval "$(jenv init -)"
eval "$(jenv init -)"

export PATH="$HOME/.yarn/bin:$PATH"

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
source  ~/powerlevel9k/powerlevel9k.zsh-theme

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
eval $(thefuck --alias)
export PATH="/usr/local/opt/erlang@18/bin:$PATH"

# pyenv to make senior project easier
eval "$(pyenv init -)"

# tabtab source for electron-forge package
# uninstall by removing these lines or running `tabtab uninstall electron-forge`
[[ -f /Users/wadeanthony/.nvm/versions/node/v8.9.3/lib/node_modules/electron-forge/node_modules/tabtab/.completions/electron-forge.zsh ]] && . /Users/wadeanthony/.nvm/versions/node/v8.9.3/lib/node_modules/electron-forge/node_modules/tabtab/.completions/electron-forge.zsh
