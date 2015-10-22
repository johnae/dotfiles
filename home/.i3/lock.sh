#!/bin/bash
 
# Dependencies:
# imagemagick
# i3lock-color-git
# scrot
 
IMAGE=/tmp/i3lock.png
LOCK=$HOME/.i3/lock.png
 
# All options are here: http://www.imagemagick.org/Usage/blur/#blur_args
#BLURTYPE="0x5" # 7.52s
#BLURTYPE="0x2" # 4.39s
#BLURTYPE="5x3" # 3.80s
BLURTYPE="8x8" # 2.90s
#BLURTYPE="2x3" # 2.92s

scrot $IMAGE
#convert $IMAGE -level 0%,100%,0.6 -blur $BLURTYPE -font Liberation-Sans -pointsize 26 -fill white -gravity northwest -annotate +0+200 'Type password to unlock' - | composite -gravity northwest $LOCK - $IMAGE
convert $IMAGE \( +clone -sepia-tone 80% \) -average -blur $BLURTYPE -modulate 80,100,100 -font Liberation-Sans -pointsize 24 -fill white -gravity northwest -annotate +140+70 'Enter password to unlock' - | composite -gravity northwest -geometry +50+50 $LOCK - $IMAGE
i3lock -e -i $IMAGE
rm $IMAGE
#i3lock --textcolor=ffffff00 --insidecolor=ffffff1c --ringcolor=ffffff3e --linecolor=ffffff00 --keyhlcolor=00000080 --ringvercolor=00000000 --insidevercolor=0000001c --ringwrongcolor=00000055 --insidewrongcolor=0000001c  -i $IMAGE
#rm $IMAGE
