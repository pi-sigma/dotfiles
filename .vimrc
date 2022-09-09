" Plugins will be downloaded under the specified directory.
call plug#begin(has('nvim') ? stdpath('data') . '/plugged' : '~/.vim/plugged')

" general
Plug 'tpope/vim-sensible'
Plug 'junegunn/seoul256.vim'
Plug 'scrooloose/nerdtree'
" display
Plug 'morhetz/gruvbox'
Plug 'Yggdroot/indentLine'
""" editing
Plug 'jiangmiao/auto-pairs' " auto-pair quotes and parens
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-commentary'
Plug 'alvan/vim-closetag'
Plug 'tpope/vim-surround'   " surround strings with quotes and parens
Plug 'mg979/vim-visual-multi', {'branch': 'master'}  " multiple cursors
Plug 'dense-analysis/ale'   " linting

call plug#end()


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Standard settings 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax on
set number		" show numbers in gutter
set relativenumber	" numbers are relative to current position
set scrolloff=999 	" smooth scrolling
set laststatus=2	" always show status bar
set hidden		" buffers are hidden (not closed) when abandoned
set ignorecase		" ignore case when searching
set smartcase		" show the next match while entering a search
set incsearch


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Colorscheme 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
colorscheme gruvbox
let g:gruvbox_contrast_dark = 'hard'


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Mappings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap Q <Nop>
vnoremap <C-c> "+y

" Leader
nnoremap <Leader>b :buffers<CR>:buffer<Space>
map <leader>q :bp<bar>sp<bar>bn<bar>bd<CR>

" fuzzy find
nmap <C-P> :FZF<CR>

" Parentheses, brackets, braces; double quotes, single quotes, ticks
vnoremap $! <esc>`>a)<esc>`<i(<esc>
vnoremap $@ <esc>`>a]<esc>`<i[<esc>
vnoremap $# <esc>`>a}<esc>`<i{<esc>
vnoremap $$ <esc>`>a"<esc>`<i"<esc>
vnoremap $% <esc>`>a'<esc>`<i'<esc>
vnoremap $^ <esc>`>a`<esc>`<i`<esc>

" Open windows on the bottom & to the right by default
set splitbelow splitright

" Simplify horizontal split navigation
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" Simplify adjusting split size
noremap <silent> <C-Right> :vertical resize +3<CR>
noremap <silent> <C-Left> :vertical resize -3<CR>
noremap <silent> <C-Up> :resize +3<CR>
noremap <silent> <C-Down> :resize -3<CR>

" Shortcut to edit nvim config
nnoremap <silent> <leader>nv :e ~/dotfiles/.vimrc<CR>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Indentline 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:indentLine_char_list = ['|', '¦', '┆', '┊']


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim-Closetag 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:closetag_filenames = '*.html,*.xhtml,*.phtml'
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx'
let g:closetag_filetypes = 'html,xhtml,phtml'
let g:closetag_xhtml_filetypes = 'xhtml,jsx'
let g:closetag_shortcut = '>'
" Add > at current position without closing the current tag, default is ''
let g:closetag_close_shortcut = '<leader>>'


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Ale 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
 let b:ale_linters = ['cc', 'flake8']
 let g:ale_linters_ignore = ['pylint', 'mypy']
 let g:ale_echo_msg_error_str = 'E'
 let g:ale_echo_msg_warning_str = 'W'
 let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
" let g:ale_lint_on_text_changed = 'never' " only lint on save
" let g:ale_lint_on_insert_leave = 0	 " only lint on save
" let g:ale_lint_on_enter = 0		 " only lint on save


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Templates
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd BufNewFile *.html 0r ~/.vim_templates/base.html
