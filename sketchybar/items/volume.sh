#!/bin/sh

sketchybar --add item volume right \
           --set volume script="$PLUGIN_DIR/volume.sh" \
                        background.color=$ACCENT_COLOR \
           --subscribe volume volume_change \
