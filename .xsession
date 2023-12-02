#!/usr/bin/bash

dwmstatus 2>&1 >/dev/null &

exec /usr/local/bin/dwm
