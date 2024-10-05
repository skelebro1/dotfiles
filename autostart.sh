#!/bin/bash

# run once function
function run {
  if ! pgrep $1 ;
  then
    $@&
  fi
}

# launch sxhkd
sxhkd -c $HOME/.config/bspwm/sxhkdrc &

# launch polybar
$HOME/.config/bspwm/polybar/launch.sh &

# set default cursor shape
xsetroot -cursor_name left_ptr &

# set wallpaper
primary_image="$HOME/Pictures/wall.png"
default_image="$HOME/.config/bspwm/wall.png"

# check if the primary image exists, if not, use the default image
if [ -f "$primary_image" ]; then
    feh --bg-fill "$primary_image"
else
    feh --bg-fill "$default_image"
fi


# launch picom
picom --config $HOME/.config/bspwm/picom.conf &

# launch polkit gnome
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &

# launch notifyd
/usr/lib/xfce4/notifyd/xfce4-notifyd &

