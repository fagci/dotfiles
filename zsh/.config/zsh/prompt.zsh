autoload -Uz vcs_info colors
colors

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

if [[ -n "${SSH_CONNECTION}" ]]; then
    PROMPT='%(?..[%?] )%{${fg[green]}%}%n@%m %{${fg[yellow]}%}%~%{${reset_color}%}${vcs_info_msg_0_}> '
else
    PROMPT='%(?..[%?] )%{${fg[yellow]}%}%~%{${reset_color}%}${vcs_info_msg_0_}> '
fi
