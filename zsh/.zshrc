# zmodload zsh/zprof

START_TIME="$(date "+%s%3N")"

source ~/.config/zsh/options.zsh
source ~/.config/zsh/keybindings.zsh
source ~/.config/zsh/prompt.zsh
source ~/.config/zsh/plugins.zsh
source ~/.config/zsh/compinit.zsh
source ~/.config/zsh/functions.zsh
source ~/.config/zsh/aliases.zsh
if hash zsh 2> /dev/null; then
    source ~/.config/zsh/fzf.zsh
fi

ELAPSED_TIME=$(($(date "+%s%3N")-$START_TIME))
echo "Startup time: ${ELAPSED_TIME}ms"

# zprof
