#!/bin/bash

# Create symlinks to dotfiles (replace existing)
ln -sf ~/.dotfiles/.bash_profile ~
ln -sf ~/.dotfiles/.bashrc ~
ln -sf ~/.dotfiles/.ctags ~
ln -sf ~/.dotfiles/.gitconfig ~
ln -sf ~/.dotfiles/.gitignore ~
ln -sf ~/.dotfiles/.pylintrc ~
ln -sf ~/.dotfiles/.vim_templates ~
mkdir ~/.config/nvim; ln -sf ~/.dotfiles/.vimrc ~/.config/nvim/init.vim

# Load terminal settings
cat ~/.dotfiles/gnome-terminal.preferences | dconf load /org/gnome/terminal/

# Swap Capslock + Escape
dconf write /org/gnome/desktop/input-sources/xkb-options "['caps:swapescape']"

# Enable Plug for Neovim
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
