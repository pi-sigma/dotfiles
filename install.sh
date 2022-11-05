#!/bin/bash

basedir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Gnome: terminal settings + key maps
dconf load /org/gnome/terminal/legacy/profiles:/ < $basedir/gnome-terminal-settings.dconf
dconf write /org/gnome/desktop/input-sources/xkb-options "['caps:swapescape', 'compose:ralt']"

# Bash
ln -sf $basedir/.bash_profile ~
ln -sf $basedir/.bashrc ~

# Git
source $basedir/git/git.sh

# Neovim
source $basedir/nvim/nvim.sh

# Misc.
ln -sf $basedir/.ctags ~
ln -sf $basedir/.pylintrc ~
