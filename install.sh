#!/bin/bash

# Gnome: terminal settings + key maps
dconf load /org/gnome/terminal/ < $PWD/dconf-settings.ini
dconf write /org/gnome/desktop/input-sources/xkb-options "['caps:swapescape', 'compose:ralt']"

# Bash
ln -s $PWD/.bash_profile ~
ln -sf $PWD/.bashrc ~

# Git
ln -sf $PWD/.gitconfig ~
ln -sf $PWD/.gitignore ~

# Neovim
source $PWD/nvim/nvim.sh

# Misc.
ln -sf $PWD/.ctags ~
ln -sf $PWD/.pylintrc ~
