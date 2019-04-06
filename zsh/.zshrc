#!zsh

export PATH=$HOME/bin:/usr/local/bin:$PATH

AG1=/usr/share/zsh/share/antigen.zsh
AG2=../usr/antigen.zsh

[ -f $AG1 ] && source $AG1
#[ -f $AG2 ] && source $AG2

#antigen use oh-my-zsh

#antigen bundle git
#antigen bundle command-not-found

#antigen bundle zsh-users/zsh-syntax-highlighting
#antigen bundle zsh-users/zsh-completions
#antigen bundle nojhan/liquidprompt
#antigen bundle zsh-users/zsh-autosuggestions
#antigen bundle sudo

#antigen bundle compleat
#antigen bundle cp


#antigen theme robbyrussell

#antigen apply

