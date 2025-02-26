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

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
if [ -d ~/.dotfiles/bash/config ]; then
	for rc in ~/.dotfiles/bash/config/*; do
		[ -f "$rc" ] && source "$rc"
	done
fi
unset rc

# start ssh-agent if it's not running
if [ -z "$SSH_AGENT_PID" ]; then
    eval $(ssh-agent -s) > /dev/null 2>&1
fi

# Terminal prompt
YELLOW="\[\e[00;33m\]"
RESET="\[\e[0m\]"
PS1="$YELLOW\w$RESET \$ "

# History
HISTFILE="$HOME/.bash_history"
HISTTIMEFORMAT="%T %y-%m-%d  "
HISTSIZE=10000000
HISTIGNORE=cd:ls:lsa:ll:history:clear:vim
HISTCONTROL=ignorespace:erasedups

# fasd
fasd_cache="$HOME/.fasd-init-bash"
if [ "$(command -v fasd)" -nt "$fasd_cache" -o ! -s "$fasd_cache" ]; then
  fasd --init posix-alias bash-hook bash-ccomp bash-ccomp-install >| "$fasd_cache"
fi
source "$fasd_cache"
unset fasd_cache

# fzf
[ -f "${XDG_CONFIG_HOME:-$HOME/.config}"/fzf/fzf.bash ] && source "${XDG_CONFIG_HOME:-$HOME/.config}"/fzf/fzf.bash

# determine search program for fzf
if type fd &> /dev/null; then
	export FZF_DEFAULT_COMMAND='fd --type file --hidden --follow --no-ignore-vcs'
	export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
fi

# Require virtualenv for pip install
export PIP_REQUIRE_VIRTUALENV=true

#
# Aliases
#
# applications & scripts
alias djtest=". $HOME/.local/bin/djtest.sh"
alias ipython="ipython --no-confirm-exit --quick --InteractiveShellApp.extensions=autoreload --InteractiveShellApp.exec_lines \%autoreload\ 2"
alias plugnvim="$HOME/.local/bin/plugnvim.sh"
alias vim=nvim
alias xdgo="xdg-open"
alias dxdgo="devour xdg-open"
alias xclipx="xclip -selection clipboard"

# git
alias gs="git status"
alias gdt="git diff-tree -r --name-only --no-commit-id $1"

# navigation
alias x="xdg-open"
alias ls="ls --color=auto"
alias lsl="ls -l --color=auto"
alias lsa="ls -a --color=auto"
alias lsal="ls -al --color=auto"
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias goto=". goto.sh"

#
# Functions
#
# Create new directory and enter it
function mk() {
  mkdir -p "$@" && cd "$@"
}

# virtualenvwrapper
function load-virtualenvwrapper {
    [ -f ~/.local/bin/virtualenvwrapper.sh ] && source ~/.local/bin/virtualenvwrapper.sh

    # activate virtualenv if argument provided
    [ -n "$1" ] && workon $1
}
if [ -n "$VIRTUAL_ENV" ]; then
    source $VIRTUAL_ENV/bin/activate;
    source $HOME/.virtualenvs/postactivate;
fi

export PYTHONBREAKPOINT=pdbr.set_trace
