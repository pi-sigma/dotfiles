#!/usr/bin/bash

dwmstatus 2>&1 >/dev/null &

setxkbmap -option compose:ralt &

picom --backend xrender --vsync &

exec /usr/local/bin/dwm
