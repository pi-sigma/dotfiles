#!/bin/bash

neovim="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

if command -v nvim &> /dev/null; then
	echo "NVIM is already installed: skipping"
else
	# Install
	mkdir -p ~/.neovim/bin
	cd ~/.neovim/bin
	curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
	chmod +x nvim.appimage
	mv nvim.appimage nvim

	# Enable Plug
	sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
	       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
fi

# Config
mkdir -p ~/.config/nvim/lua
mkdir -p ~/.config/nvim/after/syntax
ln -sf $neovim/.vimrc ~/.config/nvim/init.vim
ln -sf $neovim/config.lua ~/.config/nvim/lua/config.lua
ln -sf $neovim/python.vim ~/.config/nvim/after/syntax
ln -sf $neovim/.vim_templates ~
