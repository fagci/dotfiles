# zmodload zsh/zprof

START="$(date "+%s%3N")"

plugins=(
    autosuggestions/zsh-autosuggestions.plugin.zsh
    completions/zsh-completions.plugin.zsh
    syntax-highlighting/zsh-syntax-highlighting.plugin.zsh
)

fpath=(~/.config/zsh/prompt $fpath)
autoload -Uz prompt.zsh; prompt.zsh

stty -ixon

# Key bindings
bindkey -e
bindkey '\e[1~'   beginning-of-line  # Linux console
bindkey '\e[H'    beginning-of-line  # xterm
bindkey '\eOH'    beginning-of-line  # gnome-terminal
bindkey '\e[2~'   overwrite-mode     # Linux console, xterm, gnome-terminal
bindkey '\e[3~'   delete-char        # Linux console, xterm, gnome-terminal
bindkey '\e[4~'   end-of-line        # Linux console
bindkey '\e[F'    end-of-line        # xterm
bindkey '\eOF'    end-of-line        # gnome-termina

# History
setopt extended_history       # record timestamp of command in HISTFILE
setopt hist_expire_dups_first # delete duplicates first when HISTFILE size exceeds HISTSIZE
setopt hist_ignore_dups       # ignore duplicated commands history list
setopt hist_ignore_space      # ignore commands that start with space
setopt hist_verify            # show command with history expansion to user before running it
setopt share_history          # share command history data

# Pushd
setopt auto_pushd           # push the current directory visited on the stack.
setopt pushd_ignore_dups    # do not store duplicates in the stack.
setopt pushd_silent         # do not print the directory stack after pushd or popd.

zstyle ':completion:*' menu select
zstyle ':completion:*' group-name ''
zstyle ':completion:*' format '%F{yellow}%d:%f'
zstyle ':completion::complete:*' use-cache on
zstyle ':completion::complete:*' cache-path ~/.cache/zsh

autoload -U compinit; compinit

source ~/.config/zsh/functions.zsh
source ~/.config/zsh/aliases.zsh

# TODO: mv to ~/.local/share/zsh/
for plugin ($plugins); do
    # ts="$(date "+%s%3N")"
    source ~/.config/zsh/plugins/$plugin
    # te="$(date "+%s%3N")"
    # echo "$plugin $(($te - $ts))ms"
done

# Search history using fzf
[ -f /usr/share/doc/fzf/examples/key-bindings.zsh ] && source /usr/share/doc/fzf/examples/key-bindings.zsh

LAST_COMMAND_TIME=$(($(date "+%s%3N")-$START))
echo "Startup time: ${LAST_COMMAND_TIME}ms"

# zprof
