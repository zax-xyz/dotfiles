#!/bin/sh
feh --bg-fill ~/Pictures/wallpapers/2.png &
~/.config/polybar/launch.sh &
picom &
dunst &
xset dpms 0 0 360 &
xset s 300 30 &
xss-lock -n ~/.scripts/dim-screen.sh ~/.scripts/lock.sh &
xset r rate 200 35 &
numlockx &
# ~/.scripts/caps &
xsetroot -cursor_name left_ptr &
# ~/.scripts/capslk.sh &
# fcitx -d &
redshift &
nextcloud &
nm-applet &
conky &
# unclutter &
# xbanish -t 5000 &
flameshot &
# flashfocus &
clipmenud &
# qdbus org.kde.kded5 /kded  loadModule wacomtablet &
# mpd &
# mpDris2 &
deepin-calculator &
# mailspring -b &
thunderbird &
blueman-applet &
