xset +fp /usr/share/fonts/local
xset fp rehash

xrdb -merge /home/infy/.Xresources
#urxvtd -q -f -o
numlockx &
exec i3
