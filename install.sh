#!/bin/bash

# DWM
if [ -d $HOME/.local/etc/suckless/dwm/ ]; then
        echo "DMW is already installed: skipping"
else
        git clone git@github.com:pi-sigma/dwm.git $HOME/.local/etc/suckless/dwm/
fi

# DWM status bar
if [ -d $HOME/.local/etc/suckless/dwmstatus/ ]; then
        echo "DMW statusbar is already installed: skipping"
else
        git clone git@github.com:pi-sigma/dwmstatus.git $HOME/.local/etc/suckless/dwmstatus/
fi

# dmenu
if [ -d $HOME/.local/etc/suckless/dmenu/ ]; then
        echo "dmenu is already installed: skipping"
else
        git clone https://git.suckless.org/dmenu $HOME/.local/etc/suckless/dmenu/
fi

# Fzf
if command -v fzf &> /dev/null; then
	echo "fzf is already installed: skipping"
else
	git clone --depth 1 https://github.com/junegunn/fzf.git $HOME/.local/etc/fzf/
	yes | ~/.local/etc/fzf/install --all --xdg
fi

# Neovim
if command -v nvim &> /dev/null; then
	echo "Neovim is already installed: skipping"
else
	mkdir -p $HOME/.neovim/bin
	cd ~/.neovim/bin
	curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
	chmod +x nvim.appimage
	mv nvim.appimage nvim
fi
