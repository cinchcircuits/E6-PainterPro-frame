#!/bin/bash

git_source="git@github.com:cinchcircuits/E6-PainterPro-frame.git"
here="$HOME/E6-PainterPro-frame"
# Mount pint for cifs source
cifs=$(cat /etc/cifs-sources.txt)
# Local folder where photos will get synced to
localpics="$here/locals"
# Directory to house images for alteration and display
tmpdir=/dev/shm

# Update the code
cd $here; git pull

echo $cifs
mount $cifs
if [ $? -eq 0 ]; then
	if [ ! -d $localpics ]; then
		mkdir $localpics
	fi
	rsync -av --delete $cifs/*.jpg $cifs/*.png $cifs/*.webp $localpics/.
else
	echo "failed mount"
fi
umount $cifs

# Now, select a image from the pics dir
rando=$(cd $localpics; ls |sort -R | head -n 1)
if [ ! -f palette.pmg ]; then
	# Generate palette if needed
        convert -size 1x1 xc:black xc:red xc:lime 'xc:rgb(255,128,0)' xc:yellow xc:blue xc:white +append palette.png
fi
logger -t frame "Convertting image $rando for display"
rm -f $tmpdir/mynewfile*
convert $localpics/$rando -resize 800x480^ -brightness-contrast 0,30 -modulate 100,200,100 -gravity center -extent 800x480 -dither FloydSteinberg -remap palette.png -type truecolor $tmpdir/mynewfile180.bmp
# Add text
batt=$(python3 $here/INA219.py)
echo $batt
#convert $tmpdir/mynewfile180.bmp -gravity Center  -pointsize 30 -annotate 0 "$batt" $tmpdir/mynewfile1802.bmp
convert $tmpdir/mynewfile180.bmp -pointsize 30 -annotate +740+470 "$batt"'%' $tmpdir/mynewfile1802.bmp
# Rotate image
convert $tmpdir/mynewfile1802.bmp -rotate -180 $tmpdir/mynewfile.bmp

# Display the thing
cd $here; python3 ./display_image.py

