autoload -Uz vcs_info

PROMPT_GIT_UPDATE=1

function preexec {
    [[ "$2" == git* ]] && PROMPT_GIT_UPDATE=1
}

function chpwd {
    PROMPT_GIT_UPDATE=1
}

function precmd {
    [[ -n "$PROMPT_GIT_UPDATE" ]] && {
        PROMPT_GIT_UPDATE=
        vcs_info
    }
}

zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:git:*' formats ' %b '
setopt PROMPT_SUBST

PROMPT=''

[[ -n "$SSH_CONNECTION" ]] && PROMPT+='%F{green}%n@%m '

PROMPT+='%(?..%F{red}⊗ )'
PROMPT+='%F{yellow}%~%F{reset}'
PROMPT+='${vcs_info_msg_0_}'
PROMPT+='> '
