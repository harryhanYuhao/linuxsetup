#!/bin/sh

img=/tmp/i3lock.png
scrot --silent -o $img
convert $img -scale 10% -scale 1000% $img

# check the average brightness of the screen shot.
luminosity=`convert $img -print "%[mean]" $img`

#only fuzzy lock if the brightness is greator than the threshold
#Otherwise the 
if [ $luminosity>100 ]; then
	i3lock -i $img
else 
	i3lock 
fi
