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
PATH=$PATH:"$HOME/usr/pgsql-15/bin/"

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
if [ -d ~/.dotfiles/bash/config ]; then
	for rc in ~/.dotfiles/bash/config/*; do
		if [ -f "$rc" ]; then
			source "$rc"
		fi
	done
fi

unset rc


[ -f ~/.fzf.bash ] && source ~/.fzf.bash

export EDITOR=/usr/local/bin/nvim;

export PS1="\e[0;33m \w:\e[0m "
