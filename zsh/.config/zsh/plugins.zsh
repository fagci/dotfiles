plugins=(
    autosuggestions/zsh-autosuggestions.plugin.zsh
    completions/zsh-completions.plugin.zsh
    syntax-highlighting/zsh-syntax-highlighting.plugin.zsh
    # vi-mode/zsh-vi-mode.plugin.zsh
)

for plugin ($plugins); do
    # ts="$(date "+%s%3N")"
    source $ZSH_PLUGINS/$plugin
    # te="$(date "+%s%3N")"
    # echo "$plugin $(($te - $ts))ms"
done
