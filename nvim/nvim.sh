#!/bin/bash

if command -v nvim &> /dev/null; then
	echo "NVIM is already installed: skipping"
else
	# Install
	mkdir -p ~/.neovim/bin
	cd ~/.neovim/bin
	curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
	chmod +x nvim.appimage
	mv nvim.appimage nvim

	# Config
	mkdir -p ~/.config/nvim
	ln -sf ~/.dotfiles/.vimrc ~/.config/nvim/init.vim
	ln -sf ~/.dotfiles/.vim_templates ~

	# Enable Plug and install plugins
	sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
	       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
	nvim +PlugInstall +q +q
fi
