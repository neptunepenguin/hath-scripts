#!/bin/sh

#CACHE=$HOME/hath-exp/cache
CACHE=$HOME/documents/capybara/hath/cache

raw_properties () {
  echo filename width height format compression alpha size quality depth >> $2
  find $CACHE -type f -name "$1" |
  #head -n 12 |
  while read x; do
    if [[ -f $x ]]; then
      #echo "process $x" >&2
      identify -format "%f %w %h %m %C %A %b %Q %q\n" $x >>$2
    fi
  done
}

raw_properties '*-jpg' raw-jpg.dat
raw_properties '*-png' raw-png.dat

# the smalles size shall have 1280 pixels, that is the most common screen
# resolution ever.

# /home/grochmal/hath-exp/cache/d0/d05a09f78eb068a3142bd59adb1e72188c6bc16b-8952-350-350-png
# removing a property value
# convert
# /home/grochmal/documents/capybara/hath/cache/d0/d05a09f78eb068a3142bd59adb1e72188c6bc16b-8952-350-350-png
# +set Copyright -quality 05 png05.png

# on arch linux (newest image magick)
# convert img.png -strip newimg.png
# works!

# otptipng tries all setups of -quality lf (and more) for a png.  That's better
# than anything DIY.
# Nevertheless -quality lf means the same as:
#              -define png:compression-level=l
#              -define png:compression-filter=f
# optipng also uses -define png:compression-strategy=s

# resising the smallest size keeping aspect ratio
#  ^ - resize the smallest dimension;  > - only shrink larger images
# conver img.jpg -resize 1200x1200\>\^ -quality 75 outimg.jpg

