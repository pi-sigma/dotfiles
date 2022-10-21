#!/bin/bash

basedir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Gnome: terminal settings + key maps
dconf load /org/gnome/terminal/ < ${basedir}/dconf-settings.ini
dconf write /org/gnome/desktop/input-sources/xkb-options "['caps:swapescape', 'compose:ralt']"

# Bash
ln -sf ${basedir}/.bash_profile ~
ln -sf ${basedir}/.bashrc ~

# Git
ln -sf ${basedir}/.gitconfig ~
ln -sf ${basedir}/.gitignore ~

# Neovim
source ${basedir}/nvim/nvim.sh

# Misc.
ln -sf ${basedir}/.ctags ~
ln -sf ${basedir}/.pylintrc ~
