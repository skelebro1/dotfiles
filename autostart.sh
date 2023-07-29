#!/bin/bash

function run {
  if ! pgrep $1 ;
  then
    $@&
  fi
}

sxhkd -c $HOME/.config/bspwm/sxhkdrc &

$HOME/.config/bspwm/polybar/launch.sh &

dex $HOME/.config/autostart/arcolinux-welcome-app.desktop
xsetroot -cursor_name left_ptr &

feh --bg-fill $HOME/.config/bspwm/wall.jpeg &
run variety &
run nm-applet &
run pamac-tray &
run xfce4-power-manager &
numlockx on &
blueberry-tray &
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
/usr/lib/xfce4/notifyd/xfce4-notifyd &
run volumeicon &
#killall komorebi &
#run komorebi &
picom --config $HOME/.config/bspwm/picom.conf &
