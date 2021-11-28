fzf-history-widget() {
    setopt extendedglob
    candidates=(${(f)"$(fc -li -1 0 | fzf +s +m -x -e -q "$BUFFER")"})
    local ret=$?
    if [ -n "$candidates" ]; then
        BUFFER="${candidates[@]/(#m)*/${${(As: :)MATCH}[4,-1]}}"
        BUFFER="${BUFFER[@]/(#b)(?)\\n/$match[1]
    }"
    zle vi-fetch-history -n $BUFFER
    fi
    zle reset-prompt
    return $ret
}

zle     -N   fzf-history-widget
bindkey '^r' fzf-history-widget
bindkey -M vicmd '^r' fzf-history-widget
bindkey -M viins '^r' fzf-history-widget
