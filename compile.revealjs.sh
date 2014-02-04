#!/bin/sh
pandoc -t revealjs --template=template.revealjs \
    --standalone --smart \
    --variable theme="moon" \
    --slide-level=2 \
    --variable transition="linear" \
    $1.revealjs.md -o $1.revealjs.html

