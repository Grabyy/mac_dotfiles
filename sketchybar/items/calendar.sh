#!/bin/sh

sketchybar --add item calendar center \
           --set calendar icon=􀧞  \
                          update_freq=30 \
                          background.color=$ACCENT_COLOR       \
                          script="$PLUGIN_DIR/calendar.sh"
