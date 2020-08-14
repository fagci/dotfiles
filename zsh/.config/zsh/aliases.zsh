# vim: set filetype=zsh :
#
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

if type exa > /dev/null 2>&1; then
  alias l='exa -Gl'
  alias ls='exa -G'
  alias la='exa -Ga'
else
  alias l='ls -Gl'
  alias ls='ls -G'
  alias la='ls -Ga'
fi

if [[ "$OSTYPE" -eq "linux-android" ]] && hash pkg 2> /dev/null; then
  alias pki="pkg install"
  alias pks="pkg search"
  alias pku="pkg update"
  alias pkug="pkg upgrade"
  alias pkla="pkg list-all"
  alias pkli="pkg list-installed"
fi
