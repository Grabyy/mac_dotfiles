#!/bin/sh

# ~/.xsession
# Minimal OpenBSD X11 session
# cwm + centered xterm

# --------------------------------------------------
# X resources
# --------------------------------------------------

if [ -f "$HOME/.Xresources" ]; then
    xrdb -merge "$HOME/.Xresources"
fi

# ---------------------------------------------------
# Wallpaper
# ---------------------------------------------------

xwallpaper --zoom "$HOME/wallpaper/puffy_wallpaper.jpeg" &

# --------------------------------------------------
# Keyboard
# --------------------------------------------------

setxkbmap fr

# --------------------------------------------------
# X11 preferences
# --------------------------------------------------

xsetroot -solid '#111318'

# Disable screen blanking / DPMS
xset s off
xset -dpms
xset s noblank

# --------------------------------------------------
# Start window manager
# --------------------------------------------------

cwm &
CWM_PID=$!

# Give cwm a moment to start
sleep 0.2

# --------------------------------------------------
# Start terminal
# --------------------------------------------------

# 120x35 is a comfortable terminal size.
# cwm will manage the window.
xterm -name main-terminal \
      -title "OpenBSD" \
      -geometry 120x35 &

XTERM_PID=$!

# --------------------------------------------------
# Session
# --------------------------------------------------

# If xterm exits, terminate the X session.
wait "$XTERM_PID"

kill "$CWM_PID" 2>/dev/null
exit 0
