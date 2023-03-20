call plug#begin('~/.local/share/nvim/plugged')
	source ~/.dotfiles/nvim/plugins.vim
call plug#end()

source ~/.dotfiles/nvim/config.vim
source ~/.config/nvim/after/syntax/python.vim
source ~/.dotfiles/nvim/mappings.vim
source ~/.dotfiles/nvim/functions.vim

lua require('config')
