#!/bin/bash

case "$1" in
# screen brightness
sc-up|sc-down) DEVICE= ICON= NAME=sc STEP=5;;
# keyboard (not for Thinkpad, max value is 2, default keybind is FN+Space)
kb-up|kb-down) DEVICE="-d kbd_backlight" ICON= NAME=kb STEP=2;;
*) exit 1 ;;
esac

case "$1" in
*-up) brightnessctl $DEVICE set $STEP%+ ;;
*-down) brightnessctl $DEVICE set $STEP%- ;;
esac

# Dismiss previous notification, then show new one
makoctl dismiss 2>/dev/null

# Parse current brightness percentage from machine-readable output
BRIGHT=$(brightnessctl $DEVICE -m | awk -F, '{printf "%d", $4}')

notify-send -a wokemarchy-ctl -t 1200 -h int:value:"$BRIGHT" -h string:synchronous:${NAME}brightness "${ICON} ${BRIGHT}%"
