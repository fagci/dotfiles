# zmodload zsh/zprof

START_TIME="$(date "+%s%3N")"
ZSH_PLUGINS=~/.local/share/zsh/plugins/

source ~/.config/zsh/options.zsh
source ~/.config/zsh/keybindings.zsh
source ~/.config/zsh/prompt.zsh
source ~/.config/zsh/plugins.zsh
source ~/.config/zsh/compinit.zsh
source ~/.config/zsh/functions.zsh
source ~/.config/zsh/aliases.zsh
source ~/.config/zsh/fzf.zsh

ELAPSED_TIME=$(($(date "+%s%3N")-$START_TIME))
echo "Startup time: ${ELAPSED_TIME}ms"

# zprof
