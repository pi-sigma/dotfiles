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

# determine search program for fzf
if type fd &> /dev/null; then
	export FZF_DEFAULT_COMMAND='fd --type file --hidden --follow --no-ignore-vcs'
	export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
fi

# load virtualenvwrapper
[ -f ~/.local/bin/virtualenvwrapper.sh ] && source ~/.local/bin/virtualenvwrapper.sh

# terminal prompt
# export PS1=" \[\e[00;33m\]\w \[\e[0m\] \$ "
build_ps1() {
    local prompt_color='\[\e[33m\]'
    local host=''
    [[ $UID -eq 0 ]] && prompt_color='\[\e[1;31m\]'
    [[ $SSH_TTY ]] && host="@$HOSTNAME "
    echo "${prompt_color}${host}\w\[\e[0m\] \$ "
}
PS1=$(build_ps1)

[ -f "${XDG_CONFIG_HOME:-$HOME/.config}"/fzf/fzf.bash ] && source "${XDG_CONFIG_HOME:-$HOME/.config}"/fzf/fzf.bash


#
# Aliases
#
# applications & scripts
alias djtest=". djtest.sh"
alias vim=nvim
alias ipython="ipython --no-confirm-exit --quick --InteractiveShellApp.extensions=autoreload --InteractiveShellApp.exec_lines \%autoreload\ 2"

# navigation
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
# Create a new directory and enter it
function mk() {
  mkdir -p "$@" && cd "$@"
}

# Activate virtual env and save the path as a tmux variable,
# so that new panes/windows can re-activate as necessary
function sv() {
    source venv/bin/activate &&
    tmux set-environment VIRTUAL_ENV $VIRTUAL_ENV
}
if [ -n "$VIRTUAL_ENV" ]; then
    source $VIRTUAL_ENV/bin/activate;
fi
