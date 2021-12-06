autoload -Uz vcs_info colors
colors

PROMPT_GIT_UPDATE=1

function preexec {
    case "$2" in
        *git*)
            PROMPT_GIT_UPDATE=1
            ;;
    esac
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
zstyle ':vcs_info:git:*' formats ' %b'
zstyle ':vcs_info:*' check-for-changes false
setopt PROMPT_SUBST

if [ -z "${SSH_CONNECTION}" ]; then
    PROMPT='%(?..[%?] )%{${fg[yellow]}%}%~%{${reset_color}%}${vcs_info_msg_0_}> '
else
    PROMPT='%(?..[%?] )%{${fg[green]}%}%n@%m %{${fg[yellow]}%}%~%{${reset_color}%}${vcs_info_msg_0_}> '
fi
