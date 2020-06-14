#!/usr/bin/zsh

free | awk '/^Mem:/{printf ("%d", (($3 / $2) * 100) + 0.5)}'

