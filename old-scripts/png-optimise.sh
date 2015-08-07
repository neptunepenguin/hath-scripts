#!/bin/sh

CACHE=$HOME/hath-exp/cache
DIR=$HOME/hath-exp/pngopti

find $CACHE -type f -name '*-png' |
#head -n 12 |
while read x; do
  file=$(basename $x)
  optipng -out $DIR/$file.png $x
  sleep 12
done

