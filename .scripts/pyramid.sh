#!/bin/sh
sleep 0.5
alias key="xdotool key --delay 0"

for i in 1 2 3 2 1; do
  for j in $(seq 1 $i); do
    key Ctrl+v
  done
  key Return
done
