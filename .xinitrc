#!/usr/bin/bash

dwmstatus 2>&1 >/dev/null &

picom --backend xrender &

exec /usr/local/bin/dwm
