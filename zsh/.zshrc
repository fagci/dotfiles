# vim: set filetype=zsh :

# zmodload zsh/zprof
# beam as the cursor by default
echo -ne '\e[5 q'

export EDITOR=vim
export PATH=$PATH:~/bin

# Load version control information
autoload -Uz vcs_info
precmd() { vcs_info }

# Format the vcs_info_msg_0_ variable
zstyle ':vcs_info:git:*' formats ' %b '

setopt PROMPT_SUBST
PROMPT='%(?..%F{red}%?)%f%B%F{240}%1~%f%b${vcs_info_msg_0_}%(!.#.>) '

HISTFILE=$HOME/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

DISABLE_AUTO_UPDATE="true"

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=8'
ZSH_AUTOSUGGEST_USE_ASYNC=true

# Speed up prompt redraw, useful when using vi-mode 
# export KEYTIMEOUT=1

# bindkey -v

setopt append_history inc_append_history


# Callback for vim mode change
function zle-keymap-select () {
    if [ $KEYMAP = vicmd ]; then
        # Set block cursor
        echo -ne '\e[1 q'
    else
        # Set beam cursor
        echo -ne '\e[5 q'
    fi
}
# Bind the callback
zle -N zle-keymap-select

if [[ ! -d ~/.zinit ]]; then
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/zdharma/zinit/master/doc/install.sh)"
fi

source ~/.zinit/bin/zinit.zsh

zinit ice lucid wait"0" blockf
zinit light zsh-users/zsh-completions
zinit ice lucid wait"0" atload"_zsh_autosuggest_start"
zinit light zsh-users/zsh-autosuggestions
zinit ice lucid wait"0" atinit"zpcompinit; zpcdreplay"
zinit light zdharma/fast-syntax-highlighting

source ~/.config/zsh/functions.zsh
source ~/.config/zsh/aliases.zsh

if [[ ! -z "${PREFIX}" && $PREFIX == *"termux"* ]]; then
    export MPD_HOST=localhost
    export MPD_PORT=8600
fi



# zprof
### End of Zinit's installer chunk
