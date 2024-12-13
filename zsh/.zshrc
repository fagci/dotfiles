# zmodload zsh/zprof

# START_TIME="$(date "+%s%3N")"

source ~/.config/zsh/options.zsh
source ~/.config/zsh/keybindings.zsh
source ~/.config/zsh/prompt.zsh
source ~/.config/zsh/modules.zsh
source ~/.config/zsh/plugins.zsh
source ~/.config/zsh/aliases.zsh

source ~/.config/zsh/*.local.zsh(N) 2>/dev/null

if [ -f ~/.fzf/install ]; then
    export PATH="${HOME}/.fzf/bin:${PATH}" # prevent override old versions of fzf
    if hash fzf 2>/dev/null 
    then
        source ~/.config/zsh/fzf.zsh
    else
        ~/.fzf/install --no-update-rc --no-key-bindings --no-completion
    fi
fi

# ELAPSED_TIME=$(($(date "+%s%3N")-$START_TIME))
# echo "Startup time: ${ELAPSED_TIME}ms"

# zprof

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
