#!/bin/sh

B='#00000000'  # blank
C='#ffffff22'  # clear ish
D='#ffffff66'  # default
T='#eeeeeeee'  # text
W='#bb1111bb'  # wrong
V='#bbbbbbbb'  # verifying
K='#ffffffff'  # key highlight

killall -SIGUSR1 dunst
mpc pause
[ -z "$(pidof i3lock)" ] && i3lock  \
    --color=000000          \
    --insidevercolor=$C     \
    --ringvercolor=$V       \
    \
    --insidewrongcolor=$C   \
    --ringwrongcolor=$W     \
    \
    --insidecolor=$B        \
    --ringcolor=$D          \
    --linecolor=$B          \
    --separatorcolor=$D     \
    \
    --verifcolor=$T         \
    --wrongcolor=$T         \
    --timecolor=$T          \
    --datecolor=$T          \
    --layoutcolor=$T        \
    --keyhlcolor=$K         \
    --bshlcolor=$W          \
    \
    --clock                 \
    --timestr="%H:%M:%S"    \
    --datestr="%A, %m %Y"   \
    --wrongtext=""          \
    --noinputtext=""        \
    --veriftext=""          \
    --nofork                \
    -f
killall -SIGUSR2 dunst
