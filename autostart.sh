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
feh --bg-fill $HOME/.config/bspwm/wallpaper.jpeg &

# launch picom
picom --config $HOME/.config/bspwm/picom.conf &

# launch polkit gnome
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &

# launch notifyd
/usr/lib/xfce4/notifyd/xfce4-notifyd &
