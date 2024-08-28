#!/bin/sh

CURRENT_WIFI="$(networksetup -getairportnetwork en0)"
SSID="$(echo "$CURRENT_WIFI" | awk -F ': ' '{print $2}')"

if [ "$SSID" = "" ]; then
  sketchybar --set $NAME label="Disconnected" icon="󱚼"
else
  sketchybar --set $NAME label="$SSID" icon="󱚽"
fi
