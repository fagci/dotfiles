#!/usr/bin/env bash

# ===================================================
#
# Shoutcast mpc radio player
#
# Author: Mikhail Yudin aka fagci
# Description: uses jq json parser and mpc to tunein
#
# ===================================================

CONFIG_FILE="${HOME}/.config/shoutcast.config"

CACHE_TIME=600
BASE_URL='http://api.shoutcast.com'

SCRIPT_NAME=$(basename $0)

if [[ ! -f "${CONFIG_FILE}" ]]; then
    echo "SHOUTCAST_API_KEY=YOUR_DEV_API_TOKEN\n" > "${CONFIG_FILE}"
    $EDITOR "${CONFIG_FILE}"
fi

. "${CONFIG_FILE}"

if [[ $SHOUTCAST_API_KEY == "" ]]; then
    rm "${CONFIG_FILE}" 
    exec $(basename $0)
fi


make_query() {
    local method=$1
    local params=$2
    local response_type=${3:-'json'}

    curl -s -G \
        --data-urlencode "k=${SHOUTCAST_API_KEY}" \
        --data-urlencode "f=${response_type}" \
        --data-urlencode "${params}" \
        "${BASE_URL}/${method}" 
}

tunein() {
    base=$1
    station_id=$2

    mpc -q clear
    mpc -q -w load "http://yp.shoutcast.com/${base}?id=${station_id}"
    mpc -q play
}

search() {
    local query=$1

    local hash=$(echo -n "${query}" | md5sum | awk '{print $1}')
    
    local tmpfile="${TMPDIR:-/tmp}/${SCRIPT_NAME}.$hash.json"

    # caching query for 10m

    if [[ -f "${tmpfile}" ]]; then
        lifetime=$(expr $(date +%s) - $(date -r "${tmpfile}" +%s))
        [ $lifetime -gt $CACHE_TIME ] && rm "${tmpfile}"
    fi

    if [[ ! -f $tmpfile ]]; then
        make_query 'station/advancedsearch' "search=${query}" > $tmpfile
    fi

    json=$(cat $tmpfile)

    echo -e "Found for '${query}':\n" 

    echo $json | \
        jq -r ".response.data.stationlist.station[0:20] \
        | to_entries[] \
        | (.key|tostring) + \":\t[\"+(.value.br|tostring)+\"]\t\" + .value.name"
    
    echo ''
    read -p 'Tunein to: ' num

    base=$(echo $json | jq -r '.response.data.stationlist.tunein["base-m3u"]')
    station_id=$(echo $json | jq -r ".response.data.stationlist.station[${num}].id")
    station_name=$(echo $json | jq -r ".response.data.stationlist.station[${num}].name")

    clear
    echo "Tuning to '${station_name}'..."

    tunein $base $station_id
}

clear
query=$1

# echo "Your shoutcast api key is: '$SHOUTCAST_API_KEY'"

if [[ $query == "" ]]; then
    read -p 'Search: ' query
fi

search "${query}"

