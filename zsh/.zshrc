#!zsh

export TERM=xterm-256color
export EDITOR=vim

ANTIGEN=$HOME/antigen.zsh

[ -f $ANTIGEN ] || curl -L git.io/antigen > $ANTIGEN

if [[ -f $ANTIGEN ]]; then
  source $ANTIGEN

  antigen use oh-my-zsh

  antigen bundle history
  antigen bundle common-aliases
  antigen bundle command-not-found

  antigen bundle git
  antigen bundle gnu-utils

  antigen bundle zsh-users/zsh-completions src
  antigen bundle zsh-users/zsh-autosuggestions

  antigen theme jnrowe

  antigen apply
fi


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# functions

share() {
  curl --progress-bar -F"file=@$1" https://0x0.st | tee /dev/null
}

wttr() {
  wget -qO- wttr.in/\?nqM
}

cht() {
  where="$1"; shift
  IFS=+ curl "https://cht.sh/$where/$*"
}

# aliases

if hash exa 2> /dev/null; then
  unalias ls ll la 
  alias ls='exa'
  alias la='exa -a'
  alias ll='exa -l'
  alias lll='exa -l | less'
  alias lla='exa -la'
  alias llt='exa -T'
  alias llfu='exa -bghHliS --git'
fi

if [[ "$OSTYPE" -eq "linux-android" ]] && hash pkg 2> /dev/null; then
  alias pki="pkg install"
  alias pks="pkg search"
  alias pku="pkg update"
  alias pkug="pkg upgrade"
  alias pkla="pkg list-all"
  alias pkli="pkg list-installed"
fi
