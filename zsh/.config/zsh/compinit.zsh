zstyle ':completion:*' menu select
zstyle ':completion:*' group-name ''
zstyle ':completion:*' format '%F{yellow}%d:%f'
zstyle ':completion::complete:*' use-cache on
zstyle ':completion::complete:*' cache-path ~/.cache/zsh

zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*' list-suffixes
zstyle ':completion:*' expand prefix suffix

zstyle ':completion:*:processes' command 'ps x -o pid,s,args'

autoload -Uz compinit

for dump in ~/.zcompdump(N.mh+24); do
  compinit
done

compinit -C
