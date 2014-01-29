#!/bin/sh
pandoc --standalone --slide-level=2 --template=template-fosdem-2014.html --smart --to=dzslides --output=$2 $1
