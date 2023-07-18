#!/bin/sh

base='#1e1e2e'
text='#cdd6f4'
overlay1='#7f849c'

lavender='#b4befe'
red='#f38ba8'

B='#00000000'  # blank
F='Lato Light' # Font

time_size=72
date_size=28
greeter_size=28

mx=128
my=128

last_unlock_path="$HOME/.local/share/last_unlock"

if [ -f "$last_unlock_path" ]; then
    greeting="Last unlock $(date -r "$last_unlock_path" "+%a %d %b %T")"
fi

killall -SIGUSR1 dunst
# mpc pause
[ -z "$(pidof i3lock)" ] && i3lock  \
    --color=$base \
    --image="$HOME/Pictures/wallpapers/canvas_1080.png" \
    -F \
    --insidever-color=${base}18 \
    --ringver-color=$lavender \
    \
    --insidewrong-color=${base}18 \
    --ringwrong-color=$red \
    \
    --inside-color=$B \
    --ring-color=$overlay1 \
    --line-color=$B \
    --separator-color=$overlay1 \
    \
    --verif-color=$text \
    --wrong-color=$text \
    --modif-color=$text \
    --time-color=$text \
    --date-color=$text \
    --layout-color=$text \
    --greeter-color=$text \
    --keyhl-color=$lavender \
    --bshl-color=$red \
    \
    --force-clock \
    --time-pos="$mx:$my + $time_size" \
    --date-pos="tx+5:ty + $time_size/2 + 8" \
    --greeter-pos="tx:h-$my" \
    --time-str="%H:%M:%S" \
    --date-str="%a, %d %b %Y" \
    --greeter-text="$greeting" \
    --wrong-text="" \
    --noinput-text="" \
    --verif-text="" \
    --nofork \
    -f \
    \
    --time-align=1 \
    --date-align=1 \
    --greeter-align=1 \
    \
    --time-font="$F" \
    --date-font="$F" \
    --layout-font="$F" \
    --verif-font="$F" \
    --wrong-font="$F" \
    --greeter-font="$F" \
    --time-size="$time_size" \
    --date-size="$date_size" \
    --greeter-size="$greeter_size" \
    --radius=92 \
    --ring-width=5 \
    --pass-screen-keys \
    --pass-media-keys \
    --pass-volume-keys \
    --pass-power-keys

touch "$last_unlock_path"
killall -SIGUSR2 dunst
