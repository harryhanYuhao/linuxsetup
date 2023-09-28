#!/bin/bash

#check if gnome-shell is running
# if not, exit

if [ $XDG_CURRENT_DESKTOP != "GNOME" ]; then
  exit
fi

PICDIR=~/.local/share/wallpapers
# PICDIR=/usr/share/backgrounds
# USER=`id -un`
# UID=`id -u`
export DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/$UID/bus
GNOME_SHELL=`ps --user=$USER | grep gnome-shell$`
if [ ! -z "$GNOME_SHELL" ] ; then
  CURPIC=`ls -R $PICDIR | grep -E -i "(svg|webp|png|jpg|jpeg)$" | shuf -n 1`
  gsettings set org.gnome.desktop.background picture-uri $PICDIR/$CURPIC
  gsettings set org.gnome.desktop.background picture-uri-dark $PICDIR/$CURPIC 
fi
