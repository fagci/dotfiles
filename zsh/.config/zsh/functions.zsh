# vim: set filetype=zsh :
#
# functions

share() {
  curl --progress-bar -F"file=@$1" https://0x0.st | tee /dev/null
}

wttr() {
  wget -qO- wttr.in/\?nqM
}

cht() {
  where="$1"; shift
  IFS=+ curl "https://cht.sh/$where/$*"
}

geoip() {
  curl https://ipapi.co/${1}/json/
}

fcd() {
  cd $(find -type d -print 2> /dev/null | fzf)
}
# functions

share() {
  curl --progress-bar -F"file=@$1" https://0x0.st | tee /dev/null
}

wttr() {
  wget -qO- wttr.in/\?nqM
}

cht() {
  where="$1"; shift
  IFS=+ curl "https://cht.sh/$where/$*"
}

geoip() {
  curl https://ipapi.co/${1}/json/
}

fcd() {
  cd $(find -type d -print 2> /dev/null | fzf)
}
