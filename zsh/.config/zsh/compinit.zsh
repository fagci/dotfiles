zstyle ':completion:*' menu select
zstyle ':completion:*' group-name ''
zstyle ':completion:*' format '%F{yellow}%d:%f'
zstyle ':completion::complete:*' use-cache on
zstyle ':completion::complete:*' cache-path ~/.cache/zsh

autoload -Uz compinit

for dump in ~/.zcompdump(N.mh+24); do
  compinit
done

compinit -C
