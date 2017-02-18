#!/usr/bin/bash

# Fix keyboard layout
setxkbmap -model pc101 -layout hr,bg -variant ,phonetic -option grp:caps_toggle,grp_led:none

# Fix screen
xrandr --output DisplayPort-0 --off --output DVI-1 --mode 1280x1024 --pos 1440x0 --rotate normal --output DVI-0 --primary --mode 1440x900 --pos 0x0 --rotate normal --output HDMI-0 --off

# xfce4-panel
#xfce4-panel &

#sleep 15

# Nitrogen because I want a desktop background.
nitrogen --restore
#xsetroot -solid "#008080"

# redshift as an alternative to f.lux.
#redshift-gtk &
xflux -l 43.50 -g 16.48 -k 2300 -r 1

#sleep 5

# skype
#ghetto-skype &

#sleep 5

# Set keyboard repeat rrrrrrate
xset r rate 250 35
# No screensaver, no screen turning off and shit
xset -dpms
xset s off

# wireless icon in the tray.
nm-applet &

#sleep 5

# autocutsel and numlockx
#numlockx &
#exec autocutsel -selection PRIMARY -fork &

# Bind $mod and 0 to take a screenshot
#bindsym Print exec --no-startup-id /home/infy/screenie.py &

# Fix tablet input area
xinput set-int-prop "Genius EasyPen i405X" "Evdev Axis Calibration" 32 452 5013 658 3810

#sleep 5

/opt/telegram/Telegram -startintray &

#sleep 5

#pasystray &

# CTRL+ALT+BACKSPACE kills Xorg (fuck Firefox)
setxkbmap -option terminate:ctrl_alt_bksp

# Custom keyboard layout
xmodmap /home/infy/.Xmodmap

# Some i3bar transparency
compton &

# libnotify daemon
dunst &

# ibus daemon
#sleep 5
/usr/bin/ibus-daemon &

# workrave
workrave &

# pidgin...
pidgin &

# wbar!
wbar &

# urxvtd
/usr/bin/urxvtd -q -o &
