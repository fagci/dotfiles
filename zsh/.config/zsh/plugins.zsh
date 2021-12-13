ZSH_PLUGINS_DIR=~/.local/share/zsh/plugins

source "${ZSH_PLUGINS_DIR}/autosuggestions/zsh-autosuggestions.plugin.zsh"

fpath+="${ZSH_PLUGINS_DIR}/completions/src"
source ~/.config/zsh/compinit.zsh

source "${ZSH_PLUGINS_DIR}/syntax-highlighting/zsh-syntax-highlighting.plugin.zsh"
