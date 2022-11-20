#!/bin/bash

bash="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Symlinks
ln -sf $bash/.bash_profile ~
ln -sf $bash/.bashrc ~

# Install fuzzy find
if command -v fzf &> /dev/null; then
	echo "fzf is already installed: skipping"
else
	git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
	yes | ~/.fzf/install
fi
