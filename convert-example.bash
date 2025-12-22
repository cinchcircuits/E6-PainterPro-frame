#!/bin/bash
if [ ! -f palette.pmg ]; then
	#magick convert -size 1x1 xc:black xc:red xc:lime 'xc:rgb(255,128,0)' xc:yellow xc:blue xc:white +append palette.png
	convert -size 1x1 xc:black xc:red xc:lime 'xc:rgb(255,128,0)' xc:yellow xc:blue xc:white +append palette.png
fi
convert 278917851_10107160220882095_8834033127302500961_n.jpg -resize 800x480^ -brightness-contrast 0,30 -modulate 100,200,100 -gravity center -extent 800x480 -dither FloydSteinberg -remap palette.png -type truecolor ../pic/mynewfilei180.bmp
convert mynewfile180.bmp -gravity Center  -pointsize 30 -annotate 0 'Love you mom' mynewfile1802.bmp
convert mynewfile1802.bmp -rotate -180 mynewfile.bmp
