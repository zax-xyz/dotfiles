#!/usr/bin/env bash
line="$1"

IFS=$'\t' read -r stableId _ <<< "$line"
dim=${FZF_PREVIEW_COLUMNS}x${FZF_PREVIEW_LINES}
echo "$stableId" >> a

grim -t png -l 0 -w "$stableId" $XDG_RUNTIME_DIR/hypr/alttab/preview.png
chafa --animate false --dither=none -s "$dim" "$XDG_RUNTIME_DIR/hypr/alttab/preview.png"
