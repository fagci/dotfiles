#!zsh

export PATH=$HOME/bin:/usr/local/bin:$PATH

ANTIGEN=~/.antigen.zsh

if [ ! -f $ANTIGEN ]; then
curl -L git.io/antigen > $ANTIGEN
fi

source $ANTIGEN

antigen use oh-my-zsh

antigen bundle git
antigen bundle command-not-found

antigen theme dieter

antigen apply

