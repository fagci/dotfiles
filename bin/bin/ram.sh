#!/usr/bin/zsh

free | awk '/^Mem:/{printf ("%2d", (($3 / $2) * 100) + 0.5)}'

