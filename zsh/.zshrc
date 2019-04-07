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
