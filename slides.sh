#!/bin/sh
pandoc --standalone --slide-level=2 --template=slides.html --smart --to=dzslides --output=$2 $1
