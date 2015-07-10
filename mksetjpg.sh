#!/bin/sh

# Converts all files to the desired size (that the smallest side be 1280 pixels
# or less) and strip all EXIF information.  The conversion is directed by the
# filename data in the `fnames` directory, this allows the script to run on
# specific subsets of the files.

# enforce directory structure
DIR=$(dirname $(readlink -e "$0"))
cd "$DIR"

# jpg aa-co | png aa-aj
SUFFIX=aa
PREFIX=jpg
DATA=fnames/$PREFIX-$SUFFIX
USAGE="Usage: mksetjpg.sh <quality> [split]"

convert_imgs () {
    #total=`find $CACHE -type f -name '*-jpg'|wc -l`
    total=`wc -l $DATA`
    count=1
    #find $CACHE -type f -name '*-jpg' |
    cat $DATA |
    #head -n 12 |
    while read x
    do
        f=`basename $x`
        img="$PREFIX-$1/$SUFFIX/${f}.$PREFIX"
        echo "[$SUFFIX][$count of $total] $x INTO $img"
        #identify -format "%Q\n" $x
        convert $x -resize 1280x1280\>\^ -quality $1 -strip $img
        ((count++))
        #sleep 6
    done
}

if test "$2x" != "x"
then
    SUFFIX=$2
    DATA=fnames/$PREFIX-$SUFFIX
fi

if test "$1x" = "x"
then
    echo $USAGE
else
    if ! test -d $PREFIX-$1
    then
        echo mkdir $PREFIX-$1
        mkdir $PREFIX-$1
    fi
    if ! test -f $PREFIX-$1/$SUFFIX
    then
        echo mkdir $PREFIX-$1/$SUFFIX
        mkdir $PREFIX-$1/$SUFFIX
    fi
    convert_imgs $1 $2
fi

