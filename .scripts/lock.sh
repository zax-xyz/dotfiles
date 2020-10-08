#!/bin/sh

B='#00000000'  # blank
C='#ffffff18'  # clear ish
D='#ffffff66'  # default
T='#eeeeeeee'  # text
W='#ac1111ff'  # wrong
V='#bbbbbbbb'  # verifying
K='#ffffffff'  # key highlight
F='Lato Light' # Font

killall -SIGUSR1 dunst
# mpc pause
[ -z "$(pidof i3lock)" ] && i3lock  \
    --color=000000 \
    --insidevercolor=$C \
    --ringvercolor=$V \
    \
    --insidewrongcolor=$C \
    --ringwrongcolor=$W \
    \
    --insidecolor=$B \
    --ringcolor=$D \
    --linecolor=$B \
    --separatorcolor=$D \
    \
    --verifcolor=$T \
    --wrongcolor=$T \
    --timecolor=$T \
    --datecolor=$T \
    --layoutcolor=$T \
    --keyhlcolor=$K \
    --bshlcolor=$W \
    \
    --clock \
    --timestr="%H:%M:%S" \
    --datestr="%A, %m %Y" \
    --wrongtext="" \
    --noinputtext="" \
    --veriftext="" \
    --nofork \
    -f \
    \
    --time-font="$F" \
    --date-font="$F" \
    --layout-font="$F" \
    --verif-font="$F" \
    --wrong-font="$F" \
    --greeter-font="$F" \
    --timesize=36 \
    --datesize=16 \
    --radius=94 \
    --ring-width=5 \
    --pass-screen-keys \
    --ignore-empty-password

killall -SIGUSR2 dunst
