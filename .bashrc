# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]
then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# PATH update
PATH=$PATH:"$HOME/.neovim/bin"

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
if [ -d ~/.dotfiles/bash ]; then
	for rc in ~/.dotfiles/bash/*; do
		if [ -f "$rc" ]; then
			source "$rc"
		fi
	done
fi

unset rc
