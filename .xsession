#!/usr/bin/bash

dwmstatus 2>&1 >/dev/null &

picom &

exec /usr/local/bin/dwm
