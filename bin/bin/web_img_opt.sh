#!/usr/bin/env bash

 find . -name '*.jpg' -exec mogrify \
    -filter Triangle \
    -define filter:support=2 \
    -unsharp 0.25x0.25+8+0.065 \
    -dither None \
    -posterize 136 \
    -quality 82 \
    -define jpeg:fancy-upsampling=off \
    -define png:compression-filter=5 \
    -define png:compression-level=9 \
    -define png:compression-strategy=1 \
    -define png:exclude-chunk=all \
    -interlace Plane -colorspace sRGB \
    -strip $1 {} +

