#!/bin/bash

basedir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Gnome: terminal settings + key maps
dconf load /org/gnome/terminal/ < $basedir/dconf-settings.ini
dconf write /org/gnome/desktop/input-sources/xkb-options "['caps:swapescape', 'compose:ralt']"

# Bash
ln -s $basedir/bash_profile ~/.bash_profile
ln -sf $basedir/bashrc ~/.bashrc

# Git
ln -sf $basedir/gitconfig ~/.gitconfig
ln -sf $basedir/gitignore ~/gitignore

# Neovim
source $basedir/nvim/nvim.sh

# Misc.
ln -sf $basedir/ctags ~/.ctags
ln -sf $basedir/pylintrc ~/.pylintrc
