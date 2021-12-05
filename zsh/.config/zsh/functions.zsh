# functions

export MOZ_UA='Mozilla/5.0'
export MOZ_UA_H='User-Agent: ${MOZ_UA}'

echoerr() {
    echo "$@" 1>&2
}

# FS navigation

mkcd() {
    mkdir -p "$@" && cd "$@"
}

get-dirs() {
    find -type d \( \
        -name '.git' \
        -o -name 'node_modules' \
        -o -name '*.js.map' \
        -o -name '*.min.*' \
        -o -name '*.o' \
        \) -prune -o -print
}

fif() {
    local q="$1"
    local dir="${2:-.}"
    rg --max-filesize=512000 --line-number --smart-case \
        --hidden \
        --glob "!.git/" \
        --glob "!*.min.*" \
        --glob "!*.bundle.*" \
        --glob "!*.map" \
        "$q" "$dir"
}

fcd() {
    cd "$(get-dirs 2>/dev/null | fzf)"
}

fed() {
    "${VISUAL:-${EDITOR:-vi}}" "$(fzf)"
}

extract() {
    if [[ -z "$1" ]]; then
        echo "extracts files based on extensions"
    elif [[ -f $1 ]]; then
        case ${(L)1} in
            *.7z)      7z x $1       ;;
            *.tar.bz2) tar -jxvf $1  ;;
            *.tar.gz)  tar -zxvf $1  ;;
            *.tar.xz)  tar -xvf $1   ;;
            *.bz2)     bunzip2 $1    ;;
            *.gz)      gunzip $1     ;;
            *.jar)     unzip $1      ;;
            *.rar)     unrar x $1    ;;
            *.tar)     tar -xvf $1   ;;
            *.tbz2)    tar -jxvf $1  ;;
            *.tgz)     tar -zxvf $1  ;;
            *.zip)     unzip $1      ;;
            *.Z)       uncompress $1 ;;
            *)         echo "unable to extract '$1'"
        esac
    else
        echoerr "file '$1' does not exist!"
    fi
}

# Web dev tools

wg(){
    wget -e robots=off --user-agent "$MOZ_UA" "$@"
}

mozcurl() {
    curl -s -H "$MOZ_UA_H" "$1"
}

download_recursive() {
    if [[ $# -lt 2 ]]; then
        echoerr "Usage: <url> <extensions_comma> [destination]"
        return 1
    fi
    local uri="$1"
    local extensions="$2"
    local destination="${3-./}"

    wg -r -np -nd -nc -A "$extensions" -P "$destination" "$uri"
}

sitemaps() {
    mozcurl "${1}/robots.txt" | awk '/^Sitemap:/ {print $2}'
}

disallows() {
    mozcurl "${1}/robots.txt" | awk '/Disallow:/ {print $2}'
}

get-sitemap-urls() {
    mozcurl "$1" \
        | awk -F'[<>]' '/loc/ {print $3}'
}

get-url-status(){
    mozcurl -o /dev/null --write-out "%{http_code},%{url_effective}\n" "$@"
}

# Net

geoip() {
    curl https://ipapi.co/${1}/json/
}

extip() {
    curl https://ifconfig.me
}

# Misc

zsh-stats() {
    fc -l 1 \
        | awk '{CMD[$2]++;count++;}END { for (a in CMD)print CMD[a] " " CMD[a]/count*100 "% " a;}' \
        | grep -v "./" \
        | column -c3 -s " " -t \
        | sort -nr \
        | nl \
        | head -n25
}

share() {
    curl --progress-bar -F"file=@$1" https://0x0.st | tee /dev/null
}

wttr() {
    wget -qO- wttr.in/\?nqM
}

cht() {
    local IFS=+ 
    where="$1"
    shift
    curl "https://cht.sh/$where/$*"
}

todos() {
    awk -v IGNORECASE=1 -F'TODO:?\\s*' '/TODO/{print FILENAME ": " $2}' **/*.*(D.)
}
