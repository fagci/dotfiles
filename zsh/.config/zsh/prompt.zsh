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
zstyle ':vcs_info:git:*' formats ' %b'
setopt PROMPT_SUBST

if [[ -n "$SSH_CONNECTION" ]]; then
    PROMPT='%F{green}%n@%m %(?.%F{yellow}.%F{red})%~%F{reset}${vcs_info_msg_0_}> '
else
    PROMPT='%(?.%F{yellow}.%F{red})%~%F{reset}${vcs_info_msg_0_}> '
fi
