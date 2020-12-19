# vim: set filetype=zsh :

# zmodload zsh/zprof
autoload -Uz vcs_info
autoload colors && colors

export EDITOR=vim
export PATH=$PATH:~/bin
export PATH=$PATH:~/.local/bin
export LANG=en_US.UTF-8

DISABLE_AUTO_UPDATE="true"
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=8'

bindkey -e
bindkey  "^[[H"   beginning-of-line
bindkey  "^[[F"   end-of-line
bindkey  "^[[3~"  delete-char

HISTFILE=~/.zsh_history
HISTSIZE=30000
SAVEHIST=10000

setopt PROMPT_SUBST
setopt extended_history       # record timestamp of command in HISTFILE
setopt hist_expire_dups_first # delete duplicates first when HISTFILE size exceeds HISTSIZE
setopt hist_ignore_dups       # ignore duplicated commands history list
setopt hist_ignore_space      # ignore commands that start with space
setopt hist_verify            # show command with history expansion to user before running it
setopt share_history          # share command history data

zstyle ':vcs_info:git:*' formats ' %b '
zstyle ':completion:*' group-name ''
zstyle ':completion:*' format ' %F{yellow}-- %d --%f'
zstyle ':completion::complete:*' use-cache on
zstyle ':completion::complete:*' cache-path ~/.cache/zsh

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

zinit ice lucid wait'0' atinit'zicompinit; zicdreplay'
zinit light zdharma/fast-syntax-highlighting
zinit ice lucid wait'0' atload'_zsh_autosuggest_start'
zinit light zsh-users/zsh-autosuggestions
# zinit ice lucid wait'0'
# zinit light zsh-users/zsh-completions

source ~/.config/zsh/functions.zsh
source ~/.config/zsh/aliases.zsh

# [[ -s "/etc/grc.zsh" ]] && source /etc/grc.zsh # output hl

if [[ ! -z "${PREFIX}" && $PREFIX == *"termux"* ]]; then
    export MPD_HOST=localhost
    export MPD_PORT=8600
fi

# zprof
### End of Zinit's installer chunk
