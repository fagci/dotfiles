# aliases

alias e="$EDITOR"

alias gc="git commit -a"
alias ga="git add"
alias gcam="git commit -am"
alias gp="git push"
alias gl="git pull"

alias ls='ls --color=auto'
alias l='ls'
alias ll='ls -l'
alias la='ls -a'
alias lla='ls -la'

alias cdd='cd $(dirs -lp | fzf +m)'

if [[ "$OSTYPE" -eq "linux-android" ]] && hash pkg 2> /dev/null; then
    alias pki="pkg install"
    alias pks="pkg search"
    alias pku="pkg update"
    alias pkug="pkg upgrade"
    alias pkla="pkg list-all"
    alias pkli="pkg list-installed"
fi
