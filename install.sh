#!/bin/bash

basedir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Gnome settings
dconf load /org/gnome/terminal/legacy/profiles:/ < $basedir/gnome-terminal-settings.dconf
dconf write /org/gnome/desktop/input-sources/xkb-options "['caps:swapescape', 'compose:ralt']"
dconf write /org/gnome/desktop/sound/event-sounds "false"

# Bash
source $basedir/bash/bash.sh

# Git
source $basedir/git/git.sh

# Neovim
source $basedir/nvim/nvim.sh

# Misc.
ln -sf $basedir/.ctags ~
ln -sf $basedir/ipython/startup/ ~/.ipython/profile_default/
ln -sf $basedir/.pylintrc ~
ln -sf $basedir/.tmux.conf ~
