#!/usr/bin/env bash

T=$(sensors|sed -E -n '/[0-9]:.*\+[0-9]+\.[0-9]°[CF]/!b;s:\.[0-9]*°[CF].*$::;s:^.*\+::;p')
S=$(echo "$T"|sed ':a;N;s:\n:\+:g;ba')
C=$(echo "$T"|wc -l)
printf "%s°C\n", $(expr $S / $C)
