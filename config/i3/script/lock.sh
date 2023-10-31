img=/tmp/i3lock.png
scrot --silent -o $img
convert $img -scale 10% -scale 1000% $img

i3lock -u -i $img

# sleep 60; pgrep i3lock && xset dpms force off
