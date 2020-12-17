# vim: set filetype=zsh :

# zmodload zsh/zprof

export EDITOR=vim
export PATH=$PATH:~/bin
export PATH=$PATH:~/.local/bin
# Speed up prompt redraw, useful when using vi-mode 
export KEYTIMEOUT=1

HISTFILE=$HOME/.zsh_history
HISTSIZE=30000
SAVEHIST=10000
setopt extended_history       # record timestamp of command in HISTFILE
setopt hist_expire_dups_first # delete duplicates first when HISTFILE size exceeds HISTSIZE
setopt hist_ignore_dups       # ignore duplicated commands history list
setopt hist_ignore_space      # ignore commands that start with space
setopt hist_verify            # show command with history expansion to user before running it
setopt share_history          # share command history data
export HISTTIMEFORMAT="[%F %T] "

DISABLE_AUTO_UPDATE="true"

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=8'
ZSH_AUTOSUGGEST_USE_ASYNC=true

# Load version control information
autoload -Uz vcs_info
setopt PROMPT_SUBST
autoload colors
colors

precmd() { 
    vcs_info 

    if [ -z "${SSH_CONNECTION}" ]; then
        PROMPT="%(?..%? )%{${fg[yellow]}%}%~%{${reset_color}%}${vcs_info_msg_0_}$ "
    else
        PROMPT="%(?..%? )%{${fg[green]}%}%n@%m %{${fg[yellow]}%}%~%{${reset_color}%}${vcs_info_msg_0_}$ "
    fi
}

# Format the vcs_info_msg_0_ variable
zstyle ':vcs_info:git:*' formats ' %b '

#set -o emacs #prevent vim mode, coz of home key brings to it
bindkey -e # same as above, most used version
bindkey  "^[[H"   beginning-of-line
bindkey  "^[[F"   end-of-line
bindkey  "^[[3~"  delete-char



if [[ ! -d ~/.zinit ]]; then
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/zdharma/zinit/master/doc/install.sh)"
fi

source ~/.zinit/bin/zinit.zsh

zinit ice lucid wait"0" blockf
zinit light zsh-users/zsh-completions
zinit ice lucid wait"0" atinit"zpcompinit; zpcdreplay"
zinit light zdharma/fast-syntax-highlighting
zinit ice lucid wait"0" atload"_zsh_autosuggest_start"
zinit light zsh-users/zsh-autosuggestions

source ~/.config/zsh/functions.zsh
source ~/.config/zsh/aliases.zsh

[[ -s "/etc/grc.zsh" ]] && source /etc/grc.zsh

if [[ ! -z "${PREFIX}" && $PREFIX == *"termux"* ]]; then
    export MPD_HOST=localhost
    export MPD_PORT=8600
fi

# zprof
### End of Zinit's installer chunk
