#!/bin/bash

BASEDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Gnome: terminal settings + key maps
dconf load /org/gnome/terminal/ < ${BASEDIR}/dconf-settings.ini
dconf write /org/gnome/desktop/input-sources/xkb-options "['caps:swapescape', 'compose:ralt']"

# Bash
ln -sf ${BASEDIR}/.bash_profile ~
ln -sf ${BASEDIR}/.bashrc ~

# Git
ln -sf ${BASEDIR}/.gitconfig ~
ln -sf ${BASEDIR}/.gitignore ~

# Neovim
mkdir -p ~/.config/nvim
ln -sf ${BASEDIR}/.vimrc ~/.config/nvim/init.vim
ln -sf ${BASEDIR}/.vim_templates ~
# Enable Plug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# Misc.
ln -sf ${BASEDIR}/.ctags ~
ln -sf ${BASEDIR}/.pylintrc ~
