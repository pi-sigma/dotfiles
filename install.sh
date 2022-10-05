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

# Setup Neovim
# enable Plug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# make Neovim use .vimrc
mkdir -p ~/.config/nvim; ln -s ~/.vimrc ~/.config/nvim/init.vim
