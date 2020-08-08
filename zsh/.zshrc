# vim: set filetype=zsh :

# zmodload zsh/zprof

export EDITOR=vim
export PATH=$PATH:~/bin

HISTFILE=$HOME/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

DISABLE_AUTO_UPDATE="true"

# Speed up prompt redraw, useful when using vi-mode 
export KEYTIMEOUT=1

bindkey -v

setopt append_history inc_append_history

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

zinit ice pick"async.zsh" src"pure.zsh"
zinit light sindresorhus/pure

source ~/.config/zsh/functions.zsh
source ~/.config/zsh/aliases.zsh

if [[ ! -z "${PREFIX}" && $PREFIX == *"termux"* ]]; then
  export MPD_HOST=localhost
  export MPD_PORT=8600
fi

# zprof
### End of Zinit's installer chunk
