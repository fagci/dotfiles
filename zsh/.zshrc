#!zsh

export EDITOR=vim
export PATH=$PATH:~/bin

if [[ ! -z "${PREFIX}" && $PREFIX == *"termux"* ]]; then
  export MPD_HOST=localhost
  export MPD_PORT=8600
fi

[ -d $HOME/.zgen ] || git clone --depth 1 https://github.com/tarjoilija/zgen.git "${HOME}/.zgen"

source "${HOME}/.zgen/zgen.zsh"

if ! zgen saved; then
  zgen load mafredri/zsh-async

  zgen oh-my-zsh
  zgen oh-my-zsh plugins/git
  zgen oh-my-zsh plugins/bgnotify
  zgen oh-my-zsh plugins/command-not-found

  zgen load zsh-users/zsh-history-substring-search
  zgen load junegunn/fzf
  zgen load sindresorhus/pure

  zgen load zsh-users/zsh-autosuggestions
  zgen load zsh-users/zsh-completions

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

if hash nvim 2> /dev/null; then
    if [[ $(nvim --version | head -1 | grep -o '[0-9]\.[0-9]') -gt 0.3 ]]; then
        alias vim='nvim'
    fi
fi

if hash mosh 2> /dev/null; then
  alias mosh='mosh --no-init'
fi

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

