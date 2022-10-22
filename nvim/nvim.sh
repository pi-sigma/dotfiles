#!/bin/bash

NVIM=$HOME/.neovim

if command -v $NVIM/bin/nvim &> /dev/null; then
	echo "NVIM is already installed (via AppImage): skipping"
elif command -v nvim &> /dev/null; then
	echo "NVIM is already installed (from source or via package manager): skipping"
else
	# Install
	mkdir -p $NVIM/bin
	cd $NVIM/bin
	curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
	chmod +x nvim.appimage
	mv nvim.appimage nvim

	# Config
	mkdir -p ~/.config/nvim
	ln -sf ${HOME}/.dotfiles/.vimrc ~/.config/nvim/init.vim
	ln -sf ${HOME}/.dotfiles/.vim_templates ~

	# Enable Plug
	sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
	       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
fi
