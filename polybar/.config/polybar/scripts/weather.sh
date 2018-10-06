#!/bin/bash

URL="http://api.openweathermap.org/data/2.5/weather?q=Novosibirsk,ru&appid=bc1e24c531732375aece237bb2a5d49a"

TEMP=$(curl -s $URL | sed 's/,/\n/g' | awk -F ':' '/"temp"/ {printf("%d",-273.15+$3)}')

echo "${TEMP}°C"

