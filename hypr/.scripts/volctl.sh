#!/bin/bash
SINK="@DEFAULT_AUDIO_SINK@"

case "$1" in
up) wpctl set-volume -l 1 "$SINK" 5%+ ;;
down) wpctl set-volume -l 1 "$SINK" 5%- ;;
mute) wpctl set-mute "$SINK" toggle ;;
esac

# Dismiss previous notification, then show new one
makoctl dismiss 2>/dev/null

# Parse current state from wpctl output
INFO=$(wpctl get-volume "$SINK")
VOL=$(echo "$INFO" | awk '{printf "%d", $2 * 100}')

if echo "$INFO" | grep -q MUTED; then
  notify-send -t 1200 -h int:value:0 -h string:synchronous:vol " Muted"
else
  notify-send -t 1200 -h int:value:"$VOL" -h string:synchronous:vol " ${VOL}%"
fi

ICONS=", , "
