#!/usr/bin/env bash

# ===================================================
#
# Shoutcast mpc radio player
#
# Author: Mikhail Yudin aka fagci
# Description: uses jq json parser and mpc to tunein
#
# ===================================================

set -o nounset
set -o errexit

readonly CACHE_TIME=600
readonly BASE_URL='http://api.shoutcast.com'

readonly CONFIG_FILE="${HOME}/.config/shoutcast.config"
readonly SCRIPT_NAME=$(basename "$0")
readonly ARGS="$@"

is_config_file_absent() {
    [[ ! -f "${CONFIG_FILE}" ]]
}

create_new_config() {
    cat > "${CONFIG_FILE}" << EOL
SHOUTCAST_API_KEY=YOUR_DEV_API_TOKEN
SEARCH_LIMIT=20
EOL
}

load_config() {
    source "${CONFIG_FILE}"
}

check_config_and_load() {
    is_config_file_absent \
        && create_new_config \
        && edit_config

    load_config

    if [[ -z $SHOUTCAST_API_KEY ]]; then
        rm "${CONFIG_FILE}"
        exec "$(basename "$0")"
    fi
}

edit_config() {
    $EDITOR "${CONFIG_FILE}"
}

make_query() {
    local method=$1
    local params=$2

    curl -s -G \
        --data-urlencode "k=${SHOUTCAST_API_KEY}" \
        --data-urlencode "f=json" \
        --data-urlencode "limit=${SEARCH_LIMIT:-20}" \
        --data-urlencode "$params" \
        "${BASE_URL}/${method}" 
    }

tunein() {
    local base=$1
    local station_id=$2

    mpc -q clear
    mpc -q -w load "http://yp.shoutcast.com/${base}?id=${station_id}"
    mpc -q play
}

get_hash() {
    md5sum <<< "$1" | cut -d ' ' -f 1
}

get_cache_file_name() {
    local hash
    hash=$(get_hash "$1")
    echo "${TMPDIR:-/tmp}/${SCRIPT_NAME}.$hash.json"
}

cache_get() {
    local tmpfile
    tmpfile=$(get_cache_file_name "$1")
    if [[ -f "${tmpfile}" ]]; then
        lifetime=$(( $(date +%s) - $(date -r "${tmpfile}" +%s)))
        [ $lifetime -gt $CACHE_TIME ] && rm "${tmpfile}"
    fi
    [[ -f "${tmpfile}" ]] && cat "${tmpfile}"
}

cache_set() {
    local tmpfile
    tmpfile=$(get_cache_file_name "$1")
    echo "$2" > "${tmpfile}"
}

make_search_query() {
    local query="$1"
    local result
    result=$(cache_get "$query")

    if [[ -z "$result" ]]; then
        result=$(make_query 'station/advancedsearch' "search=${query}")
        cache_set "$query" "$result"
    fi

    echo "$result"
}

search() {
    local query="$1"
    local items_path='to_entries[]|(.key|tostring)+"\t"+(.value.br|tostring)+"\t"+(.value.name|tostring)'

    local json
    local stationlist_json
    local stations_json
    local stations_list

    local base
    local station_id
    local station_name

    clear

    echo 'Searching...'

    json=$(make_search_query "$query")

    stationlist_json=$(jq -cM '.response.data.stationlist' <<< "$json")
    stations_json=$(jq -cM '.station | if type == "object" then [.] else . end' <<< "$stationlist_json")
    stations_list=$(jq -crM "$items_path" <<< "$stations_json")


    clear

    echo -e "Found for '${query}':\n" 
    echo -e "Num\tBR\tName\n"
    echo "${stations_list/&amp;/&}"

    echo ''
    read -r -p 'Tunein to: ' num

    base=$(jq -r '.tunein["base-m3u"]' <<< "$stationlist_json")
    station_id=$(jq -r ".[${num}].id" <<< "$stations_json")
    station_name=$(jq -r ".[${num}].name" <<< "$stations_json")

    echo "Tuning to '${station_name}'..."

    tunein "$base" "$station_id"
}

ask_for_search() {
    local query="${1:-}"

    clear

    [[ -z $query ]] \
        && read -r -p 'Search: ' query

    search "$query"
}


show_help() {
    cat <<-END
Shoutcast mpc radio player

Usage: ${SCRIPT_NAME} [args] [search_query]

Args:

    -c, --config    edit config file
    -h, --help      show help
END
    exit 0
}

cmdline() {
    [ $# -eq 0 ] && ask_for_search

    while [ $# -gt 0 ]; do
        case "$1" in
            --config*|-c*) edit_config ;;
            --help|-h) show_help ;;
            *) ask_for_search "$1" ;;
        esac
        shift
    done
}

main() {
    check_config_and_load
    cmdline "$ARGS"
}

main

