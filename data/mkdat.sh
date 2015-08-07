#!/bin/sh

CACHE=$HOME/documents/capybara/hath/cache

echo "find $CACHE -type f -name '*-jpg' > all-jpg.dat"
find $CACHE -type f -name '*-jpg' > all-jpg.dat
echo "find $CACHE -type f -name '*-png' > all-png.dat"
find $CACHE -type f -name '*-png' > all-png.dat
echo "split all-jpg.dat jpg-"
split all-jpg.dat jpg-
echo "split all-png.dat png-"
split all-png.dat png-

