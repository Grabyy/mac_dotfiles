#!/bin/sh

CURRENT_WIFI="$(ipconfig getsummary en0)"
SSID="$(echo "$CURRENT_WIFI" | awk -F ' SSID : '  '/ SSID : / {print $2}')"

if [ "$SSID" = "" ]; then
  sketchybar --set $NAME label="Disconnected" icon="󱚼"
else
  sketchybar --set $NAME label="$SSID" icon="󱚽"
fi
