#!/bin/sh

sketchybar --add item media center \
           --set media label.max_chars=20 \
                       icon.padding_left=10 \
                       scroll_texts=on \
                       icon=􀑪             \
                       script="$PLUGIN_DIR/media.sh" \
           --subscribe media media_change
