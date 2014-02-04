#!/bin/sh
pandoc -t dzslides --template=template.dzslides \
    --standalone --smart \
    $1.dzslides.md -o $1.dzslides.html
