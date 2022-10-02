#!/bin/bash

# Create symlinks to dotfiles (replace existing)
ln -sf ~/.dotfiles/.bash_profile ~
ln -sf ~/.dotfiles/.bashrc ~
ln -sf ~/.dotfiles/.gitconfig ~
ln -sf ~/.dotfiles/.gitignore ~
ln -sf ~/.dotfiles/.vimrc ~
ln -sf ~/.dotfiles/.pylintrc ~

# Copy folders
cp -r ~/.dotfiles/.vim_templates ~

# Load terminal settings
cat ~/.dotfiles/gnome-terminal.preferences | dconf load /org/gnome/terminal/
