source ../usr/antigen.zsh

antigen use oh-my-zsh

antigen bundle git
antigen bundle command-not-found

antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-completions
#antigen bundle nojhan/liquidprompt
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle sudo

antigen bundle compleat
antigen bundle cp

antigen theme dieter

antigen apply
