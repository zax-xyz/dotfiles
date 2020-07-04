#!/bin/sh
feh --bg-fill ~/Pictures/Wallpapers/Dots3.png &
~/.config/polybar/launch.sh &
picom &
dunst &
xset dpms 0 0 360 &
xset s 180 0 &
xss-lock -n ~/.scripts/dim-screen.sh ~/.scripts/lock.sh &
xset r rate 200 35 &
# ~/.scripts/capslk.sh &
# fcitx -d &
redshift &
nextcloud &
conky &
# unclutter &
# xbanish -t 5000 &
flameshot &
# flashfocus &
clipmenud &
qdbus org.kde.kded5 /kded  loadModule wacomtablet &
mpd &
mpDris2 &
deepin-calculator &
~/.scripts/setxkb &
xsetroot -cursor_name left_ptr &
