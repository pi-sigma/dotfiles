#!/usr/bin/bash

dwmstatus 2>&1 >/dev/null &

picom --backend xrender --vsync &

exec /usr/local/bin/dwm
