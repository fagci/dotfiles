#!zsh

# zmodload zsh/zprof

export EDITOR=vim
export PATH=$PATH:~/bin

export ZGEN_PREZTO_LOAD_DEFAULT=0

ZSH_AUTOSUGGEST_USE_ASYNC=1
ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20

DISABLE_AUTO_UPDATE="true"
COMPLETION_WAITING_DOTS="true"

HISTFILE=$HOME/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

# Show history
case $HIST_STAMPS in
  "mm/dd/yyyy") alias history='fc -fl 1' ;;
  "dd.mm.yyyy") alias history='fc -El 1' ;;
  "yyyy-mm-dd") alias history='fc -il 1' ;;
  *) alias history='fc -l 1' ;;
esac

setopt append_history
setopt extended_history
setopt hist_expire_dups_first
setopt hist_ignore_dups # ignore duplication command history list
setopt hist_ignore_space
setopt hist_verify
setopt inc_append_history
setopt share_history # share command history data

if [[ ! -z "${PREFIX}" && $PREFIX == *"termux"* ]]; then
  export MPD_HOST=localhost
  export MPD_PORT=8600
fi

[ -d $HOME/.zgen ] || git clone --depth 1 https://github.com/tarjoilija/zgen.git "${HOME}/.zgen"

source "${HOME}/.zgen/zgen.zsh"

if ! zgen saved; then
  zgen prezto
  zgen prezto history-substring-search
  zgen prezto autosuggestions

  zgen load "mafredri/zsh-async" # Used by pure theme 

  zgen load "Riatre/pure"
  zgen load zdharma/fast-syntax-highlighting

  zgen save
fi

# bindkey -v

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

alias gc="git commit -a"
alias ga="git add"
alias gcam="git commit -am"
alias gp="git push"
alias gl="git pull"

if hash nvim 2> /dev/null; then
    if [[ $(nvim --version | head -1 | grep -o '[0-9]\.[0-9]') -gt 0.3 ]]; then
        alias vim='nvim'
    fi
fi

if hash mosh 2> /dev/null; then
  alias mosh='mosh --no-init'
fi

if hash exa 2> /dev/null; then
  # unalias ls ll la 
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

# zprof
