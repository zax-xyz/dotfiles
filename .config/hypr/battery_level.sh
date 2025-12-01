bat=$(cat /sys/class/power_supply/BAT1/capacity)
if [ -z "$bat" ]; then
    exit
fi

if [ "$bat" -eq 100 ]; then
    icon="󰁹"
elif [ "$bat" -gt 90 ]; then
    icon="󰂂"
elif [ "$bat" -gt 80 ]; then
    icon="󰂁"
elif [ "$bat" -gt 70 ]; then
    icon="󰂀"
elif [ "$bat" -gt 60 ]; then
    icon="󰁿"
elif [ "$bat" -gt 50 ]; then
    icon="󰁾"
elif [ "$bat" -gt 40 ]; then
    icon="󰁽"
elif [ "$bat" -gt 30 ]; then
    icon="󰁼"
elif [ "$bat" -gt 20 ]; then
    icon="󰁻"
elif [ "$bat" -gt 10 ]; then
    icon="󰁺"
else
    icon="󰂃"
fi

echo "$icon $bat%"
