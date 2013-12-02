#!/bin/sh

sleep 5

## Wireles...
nm-applet &

sleep 3

# Background image pls?
nitrogen --restore

sleep 2 && xflux -l 43.5069437 -g 16.442957

sleep 3

# Trayer! :D
trayer --edge bottom --align right --SetDockType true --expand false --tint 0x000000 --alpha 0 --transparent true --height 18 &

# Dzen2!
sleep 10

conky | dzen2 -e - -h '17' -ta r -fg '#aaaaaa' -bg '#000000' -fn '-misc-fixed-medium-r-*--12-110-75-75-c-60-iso10646-1' -y 864 -x 238 -w 1200 &

# x screen
sleep 3
xset -dpms; xset s off; xset r rate 500 30
thunar --daemon &

# Etc...
sleep 10
skype &

# Eh?
#ipc-socket ~/.i3/i3-ipc.sock

#exit 0
