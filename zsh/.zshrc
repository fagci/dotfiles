#!zsh

ANTIGEN=$HOME/.antigen.zsh

[ -f $ANTIGEN ] || curl -L git.io/antigen > $ANTIGEN

if [[ -f $ANTIGEN ]]; then
  source $ANTIGEN

  antigen use oh-my-zsh

  antigen bundle history
  antigen bundle common-aliases
  antigen bundle command-not-found

  antigen bundle git
  antigen bundle gnu-utils

  antigen bundle zsh-users/zsh-completions src
  antigen bundle zsh-users/zsh-autosuggestions

  antigen theme dieter

  antigen apply
fi


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# aliases

if hash pkg 2> /dev/null; then
  alias pki="pkg install"
  alias pks="pkg search"
  alias pku="pkg update"
  alias pkug="pkg upgrade"
  alias pkla="pkg list-all"
  alias pkli="pkg list-installed"
fi
