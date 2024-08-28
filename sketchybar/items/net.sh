#!/bin/sh

sketchybar --add item net right \
           --set net script="$PLUGIN_DIR/net.sh" \
           background.color=$ACCENT_COLOR \
           update_freq=5 \
           click_script="open -a System\ Settings /System/Library/PreferencePanes/Network.prefPane"

