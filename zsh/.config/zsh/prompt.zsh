autoload -Uz vcs_info colors
colors

PROMPT_GIT_UPDATE=1

function preexec {
    if [[ "$2" == git* ]]; then
        PROMPT_GIT_UPDATE=1
    fi
}

function chpwd {
    PROMPT_GIT_UPDATE=1
}

function precmd {
    if [[ -n "$PROMPT_GIT_UPDATE" ]] ; then
        vcs_info
        PROMPT_GIT_UPDATE=
    fi
}

zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:*' check-for-changes false
zstyle ':vcs_info:git:*' formats ' %b'
setopt PROMPT_SUBST

if [[ -n "${SSH_CONNECTION}" ]]; then
    PROMPT='%(?..[%?] )%{${fg[green]}%}%n@%m %{${fg[yellow]}%}%~%{${reset_color}%}${vcs_info_msg_0_}> '
else
    PROMPT='%(?..[%?] )%{${fg[yellow]}%}%~%{${reset_color}%}${vcs_info_msg_0_}> '
fi
