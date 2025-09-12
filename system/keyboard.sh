#!/bin/bash

# Swap Alt + Escape

rm /etc/X11/xorg.conf.d/00-keyboard.conf

cat << EOF >> /etc/X11/xorg.conf.d/00-keyboard.conf
# Written by systemd-localed(8), read by systemd-localed and Xorg. It's
# probably wise not to edit this file manually :) Use localectl(1) to
# instruct systemd-localed to update it.
Section "InputClass"
        Identifier            "system-keyboard"
        MatchIsKeyboard       "on"
        Option "XkbLayout"    "us"
        Option "XkbOptions"   "caps:swapescape"
EndSection
EOF
