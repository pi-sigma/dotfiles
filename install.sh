#!/bin/bash

# Create symlinks to dotfiles (replace existing)
ln -sf ~/.dotfiles/.bash_profile ~
ln -sf ~/.dotfiles/.bashrc ~
ln -sf ~/.dotfiles/.gitconfig ~
ln -sf ~/.dotfiles/.gitignore ~
ln -sf ~/.dotfiles/.vimrc ~

# Copy folders
cp -r ~/.dotfiles/.vim_templates ~
