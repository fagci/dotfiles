#!zsh

export TERM=xterm-256color
export EDITOR=vim
export PATH=$PATH:~/bin

if [[ ! -z "${PREFIX}" && $PREFIX == *"termux"* ]]; then
  export MPD_HOST=localhost
  export MPD_PORT=8600
fi

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

  antigen bundle zsh-users/zsh-syntax-highlighting

  antigen bundle zsh-users/zsh-completions src
  antigen bundle zsh-users/zsh-autosuggestions

  antigen bundle mafredri/zsh-async
  antigen bundle sindresorhus/pure

  #antigen theme 0i0/0i0.zsh-theme

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

geoip() {
  curl https://ipapi.co/${1}/json/
}

fcd() {
  cd $(find -type d -print 2> /dev/null | fzf)
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
