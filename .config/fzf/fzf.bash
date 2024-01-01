# Setup fzf
# ---------
if [[ ! "$PATH" == */home/pschilling/.local/etc/fzf/bin* ]]; then
  PATH="${PATH:+${PATH}:}/home/pschilling/.local/etc/fzf/bin"
fi

eval "$(fzf --bash)"
