#!/bin/sh

# Example notifier script -- lowers screen brightness, then waits to be killed
# and restores previous brightness on exit.

## CONFIGURATION ##############################################################

# Brightness will be lowered to this value.
min_brightness=0.04

# If your video driver works with xbacklight, set -time and -steps for fading
# to $min_brightness here. Setting steps to 1 disables fading.
fade_time=350
fade_steps=20

# If you have a driver without RandR backlight property (e.g. radeon), set this
# to use the sysfs interface and create a .conf file in /etc/tmpfiles.d/
# containing the following line to make the sysfs file writable for group
# "users":
#
#     m /sys/class/backlight/acpi_video0/brightness 0664 root users - -
#
#sysfs_path=/sys/class/backlight/acpi_video0/brightness

# Time to sleep (in seconds) between increments when using sysfs. If unset or
# empty, fading is disabled.
fade_step_time=0.05

###############################################################################

get_brightness() {
    if [ -z $sysfs_path ]; then
        xbacklight -get
    else
        cat $sysfs_path
    fi
}

set_brightness() {
    if [ -z $sysfs_path ]; then
        xbacklight -steps 1 -set $1
    else
        echo $1 > $sysfs_path
    fi
}

fade_brightness() {
    if [ -z $sysfs_path ]; then
        xbacklight -time $fade_time -steps $fade_steps -set $1
    elif [ -z $fade_step_time ]; then
        set_brightness $1
    else
        local level
        for level in $(eval echo {$(get_brightness)..$1}); do
            set_brightness $level
            sleep $fade_step_time
        done
    fi
}

trap 'exit 0' TERM INT
trap "fade_time=150 fade_brightness $(get_brightness); kill %%" EXIT
fade_brightness $min_brightness
sleep 60 &
wait
# fade_brightness 0
notify-send 'Locking in 30 seconds' 'Locking screen due to inactivity...'
sleep 30 &
wait
# ~/.scripts/lock.sh &
sleep infinity &
wait
