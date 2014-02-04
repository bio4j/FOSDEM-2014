#!/bin/sh
pandoc --standalone --slide-level=2 --template=template-fosdem-2014.html --smart --to=dzslides --output=$1.html $1.md

# usage:
# ./slides.sh bio4j-statika-slides
