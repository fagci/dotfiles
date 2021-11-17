#!/usr/bin/zsh

vmstat 1 2 | awk 'NR==4{printf "%2d", 100-$(NF-2)}'

