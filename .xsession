#!/bin/sh
# ~/.xsession
# Minimal OpenBSD X11 session
# cwm + centered xterm

xrdb -merge "$HOME/.Xressources"
xwallpaper --zoom "$HOME/wallpaper/puffy_wallpaper.jpeg" &
picom --config "$HOME/.config/picom/picom.conf" &
setxkbmap fr
xterm &
cwm
