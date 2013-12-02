#!/bin/sh
# Xrandr...
#xrandr --output DisplayPort-0 --off --output DVI-1 --mode 1280x1024 --pos 1440x0 --rotate normal --output DVI-0 --mode 1440x900 --pos 0x124 --rotate normal --output HDMI-0 --off
# Kill xfdesktop
sleep 10
xfdesktop --quit
# Nitrogen!
sleep 10
nitrogen --restore
sleep 1
wbar -above-desk -isize 32 -idist 15 -pos left -dblclk 0 -bpress -vbar -balfa 30 -falfa 60 -zoomf 1.3 &
# Run dzen2 here.
sleep 5
xflux -l 43.5069437 -g 16.442957
sleep 1
killall xfce4-panel
sleep 1
tint2 &
sleep 2
#dzen2...
conky | dzen2 -dock -e - -h '17' -ta r -fg '#aaaaaa' -bg '#000000' -fn '-misc-fixed-medium-r-*--12-110-75-75-c-60-iso10646-1' -w 1440 &
# Etc.
sleep 20
skype &



exit 0
