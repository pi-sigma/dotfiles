#!/bin/bash

# Eliminate screen tearing

rm /etc/X11/xorg.conf.d/20-intel-gpu.conf

cat << EOF >> /etc/X11/xorg.conf.d/20-intel-gpu.conf
Section "Device"
    Identifier     "Intel Graphics"
    Driver         "intel"
    Option         "TearFree" "true"
EndSection
EOF
