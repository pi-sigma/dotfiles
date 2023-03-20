#!/bin/bash

bash="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Symlinks
ln -sf $bash/profile ~/.profile
ln -sf $bash/bashrc ~/.bashrc

# Install fuzzy find and symlink .fdfignore
if command -v fzf &> /dev/null; then
	echo "fzf is already installed: skipping"
	ln -sf $bash/.fdignore ~
else
	git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
	yes | ~/.fzf/install
	ln -sf $bash/.fdignore ~
fi
