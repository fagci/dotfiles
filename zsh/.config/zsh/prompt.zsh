autoload -Uz vcs_info colors
colors

precmd() { vcs_info }

zstyle ':vcs_info:git:*' formats ' %b'
setopt PROMPT_SUBST

if [ -z "${SSH_CONNECTION}" ]; then
    PROMPT='%(?..[%?] )%{${fg[yellow]}%}%~%{${reset_color}%}${vcs_info_msg_0_}> '
else
    PROMPT='%(?..[%?] )%{${fg[green]}%}%n@%m %{${fg[yellow]}%}%~%{${reset_color}%}${vcs_info_msg_0_}> '
fi
