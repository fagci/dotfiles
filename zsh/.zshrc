# vim: set filetype=zsh :

# zmodload zsh/zprof
autoload -Uz vcs_info colors

export INPUTRC=~/.inputrc
export EDITOR=nvim
export PATH=$PATH:~/bin:~/.local/bin
export LANG=en_US.UTF-8

DISABLE_AUTO_UPDATE="true"
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=8'

bindkey -e
bindkey '\e[1~'   beginning-of-line  # Linux console
bindkey '\e[H'    beginning-of-line  # xterm
bindkey '\eOH'    beginning-of-line  # gnome-terminal
bindkey '\e[2~'   overwrite-mode     # Linux console, xterm, gnome-terminal
bindkey '\e[3~'   delete-char        # Linux console, xterm, gnome-terminal
bindkey '\e[4~'   end-of-line        # Linux console
bindkey '\e[F'    end-of-line        # xterm
bindkey '\eOF'    end-of-line        # gnome-termina

HISTFILE=~/.zsh_history
HISTSIZE=30000
SAVEHIST=10000

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

if [[ ! -d ~/.zinit ]]; then
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/zdharma/zinit/master/doc/install.sh)"
    zcompile ~/.zinit/bin/zinit.zsh
fi

source ~/.zinit/bin/zinit.zsh

zinit for \
    light-mode  zsh-users/zsh-autosuggestions \
    light-mode  zsh-users/zsh-completions \
    light-mode  zdharma/fast-syntax-highlighting \
                zdharma/history-search-multi-word

source ~/.config/zsh/functions.zsh
source ~/.config/zsh/aliases.zsh

# zprof
### End of Zinit's installer chunk
