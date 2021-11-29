plugins=(
    autosuggestions/zsh-autosuggestions.plugin.zsh
    completions/zsh-completions.plugin.zsh
    syntax-highlighting/zsh-syntax-highlighting.plugin.zsh
)

ZSH_PLUGINS=~/.local/share/zsh/plugins/

for plugin ($plugins); do
    source $ZSH_PLUGINS/$plugin
done
