# aliases

alias gc="git commit -a"
alias ga="git add"
alias gcam="git commit -am"
alias gp="git push"
alias gl="git pull"

alias cdd='cd $(dirs -lp | fzf +m)'

if type exa > /dev/null 2>&1; then
  alias ls='exa'
  alias l='exa'
  alias ll='exa -l'
  alias la='exa -a'
  alias lla='exa -la'
  alias L='exa -G'
  alias LL='exa -lG'
  alias LA='exa -aG'
  alias LLA='exa -laG'
else
  alias ls='ls --color=auto'
  alias l='ls'
  alias ll='ls -l'
  alias la='ls -a'
  alias lla='ls -la'
  alias L='ls -G'
  alias LL='ls -lG'
  alias LA='ls -aG'
  alias LLA='ls -laG'
fi

if [[ "$OSTYPE" -eq "linux-android" ]] && hash pkg 2> /dev/null; then
  alias pki="pkg install"
  alias pks="pkg search"
  alias pku="pkg update"
  alias pkug="pkg upgrade"
  alias pkla="pkg list-all"
  alias pkli="pkg list-installed"
fi
