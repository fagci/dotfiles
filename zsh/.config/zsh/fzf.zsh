function fzf-history-widget () {
    BUFFER=$(history -n 1 | awk '!a[$0]++' | fzf --reverse -i +m)
    CURSOR=$#BUFFER
    zle reset-prompt
}

zle     -N   fzf-history-widget
bindkey '^r' fzf-history-widget
bindkey -M vicmd '^r' fzf-history-widget
bindkey -M viins '^r' fzf-history-widget
