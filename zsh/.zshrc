# vim: set filetype=zsh :

START="$(date "+%s%3N")"

# zmodload zsh/zprof
autoload -Uz vcs_info colors

stty -ixon
bindkey -e
bindkey '\e[1~'   beginning-of-line  # Linux console
bindkey '\e[H'    beginning-of-line  # xterm
bindkey '\eOH'    beginning-of-line  # gnome-terminal
bindkey '\e[2~'   overwrite-mode     # Linux console, xterm, gnome-terminal
bindkey '\e[3~'   delete-char        # Linux console, xterm, gnome-terminal
bindkey '\e[4~'   end-of-line        # Linux console
bindkey '\e[F'    end-of-line        # xterm
bindkey '\eOF'    end-of-line        # gnome-termina


setopt prompt_subst
setopt extended_history       # record timestamp of command in HISTFILE
setopt hist_expire_dups_first # delete duplicates first when HISTFILE size exceeds HISTSIZE
setopt hist_ignore_dups       # ignore duplicated commands history list
setopt hist_ignore_space      # ignore commands that start with space
setopt hist_verify            # show command with history expansion to user before running it
setopt share_history          # share command history data

zstyle ':vcs_info:git:*' formats ' %b'
zstyle ':completion:*' menu select
zstyle ':completion:*' group-name ''
zstyle ':completion:*' format '%F{yellow}%d:%f'
zstyle ':completion::complete:*' use-cache on
zstyle ':completion::complete:*' cache-path ~/.cache/zsh

colors
precmd() { 
    vcs_info 
    if [ -z "${SSH_CONNECTION}" ]; then
        PROMPT="%(?..[%?] )%{${fg[yellow]}%}%~%{${reset_color}%}${vcs_info_msg_0_}> "
    else
        PROMPT="%(?..[%?] )%{${fg[green]}%}%n@%m %{${fg[yellow]}%}%~%{${reset_color}%}${vcs_info_msg_0_}> "
    fi
}

if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

zinit for \
    light-mode  zsh-users/zsh-autosuggestions \
    light-mode  zsh-users/zsh-completions \
    light-mode  zdharma-continuum/fast-syntax-highlighting \
                zdharma-continuum/history-search-multi-word

source ~/.config/zsh/functions.zsh
source ~/.config/zsh/aliases.zsh

LAST_COMMAND_TIME=$(($(date "+%s%3N")-$START))
echo "Startup time: ${LAST_COMMAND_TIME}ms"
# zprof

### End of Zinit's installer chunk
