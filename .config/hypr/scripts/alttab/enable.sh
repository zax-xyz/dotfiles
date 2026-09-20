#!/usr/bin/env bash
mkdir -p $XDG_RUNTIME_DIR/hypr/alttab
hyprctl -q --batch "keyword animations:enabled false; keyword unbind ALT, TAB ; keyword unbind ALT SHIFT, TAB"
footclient -W 80x20 -a alttab $HOME/.config/hypr/scripts/alttab/alttab.sh $1
hyprctl --batch -q "dispatch focuswindow address:$(cat $XDG_RUNTIME_DIR/hypr/alttab/address) ; dispatch alterzorder top"
