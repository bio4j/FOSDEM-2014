#!/bin/sh
pandoc -t dzslides --template=template.dzslides \
    --standalone --smart \
    $1.md -o $1.html

    # --slide-level=2 \
# usage:
# ./slides.sh bio4j-statika-slides
