#!/bin/bash 

if pgrep -x "waybar" > /dev/null; then
	# kill waybar
	pkill waybar
else
	# start waybar
	waybar & disown
fi
