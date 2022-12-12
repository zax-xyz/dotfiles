#!/bin/sh

base='#1e1e2e'
mantle='#181825'
crust='#11111b'

text='#cdd6f4'
subtext0='#a6adc8'
subtext1='#bac2de'

surface0='#313244'
surface1='#45475a'
surface2='#585b70'

overlay0='#6c7086'
overlay1='#7f849c'
overlay2='#9399b2'

blue='#89b4fa'
lavender='#b4befe'
sapphire='#74c7ec'
sky='#89dceb'
teal='#94e2d5'
green='#a6e3a1'
yellow='#f9e2af'
peach='#fab387'
maroon='#eba0ac'
red='#f38ba8'
mauve='#cba6f7'
pink='#f5c2e7'
flamingo='#f2cdcd'
rosewater='#f5e0dc'

B='#00000000'  # blank
F='Lato Light' # Font

killall -SIGUSR1 dunst
# mpc pause
[ -z "$(pidof i3lock)" ] && i3lock  \
    --color=$base \
    --image=$HOME/Pictures/wallpapers/2_1080.png \
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
    --clock \
    --time-str="%H:%M:%S" \
    --date-str="%a, %d %b %Y" \
    --wrong-text="" \
    --noinput-text="" \
    --verif-text="" \
    --nofork \
    -f \
    \
    --time-font="$F" \
    --date-font="$F" \
    --layout-font="$F" \
    --verif-font="$F" \
    --wrong-font="$F" \
    --greeter-font="$F" \
    --time-size=36 \
    --date-size=16 \
    --radius=94 \
    --ring-width=5 \
    --pass-screen-keys \
    --pass-media-keys \
    --pass-volume-keys \
    --pass-power-keys

killall -SIGUSR2 dunst
