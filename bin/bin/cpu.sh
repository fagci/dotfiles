#!/usr/bin/zsh

vmstat 1 2 | tail -1 | awk '{printf "%2d", 100 - $15}'

