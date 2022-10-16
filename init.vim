" Plugins will be installed in ~/.local/share/nvim/plugged
call plug#begin(stdpath('data') . '/plugged')
" general
Plug 'tpope/vim-sensible'

" display
Plug 'morhetz/gruvbox'
Plug 'Yggdroot/indentLine'

""" editing + navigating
Plug 'scrooloose/nerdtree'
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-commentary'
Plug 'alvan/vim-closetag'
Plug 'tpope/vim-surround'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'dense-analysis/ale'
call plug#end()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Standard settings 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax on
set number
set relativenumber
set signcolumn=number
set scrolloff=999 	" smooth scrolling
set laststatus=2	" always show status bar
set hidden		" allow re-use of the same window by hiding (not closing) buffers
set ignorecase
set smartcase		" show the next match while entering a search
set incsearch
set cc=88

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
nmap <A-f> :FZF<CR>

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
nnoremap <silent> <leader>nv :e ~/.dotfiles/init.vim<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Indentline 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:indentLine_char_list = ['|', '¦', '┆', '┊']

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Vim-Closetag 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:closetag_filenames = '*.html,*.xhtml,*.phtml'
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx'
let g:closetag_filetypes = 'html,xhtml,phtml'
let g:closetag_xhtml_filetypes = 'xhtml,jsx'
let g:closetag_shortcut = '>'
" Add > at current position without closing the current tag, default is ''
let g:closetag_close_shortcut = '<leader>>'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Ale 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let b:ale_linters = ['cc', 'pylint']
let g:ale_linters_ignore = ['mypy', 'flake8']
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_lint_on_text_changed = 'never' " only lint on save
let g:ale_lint_on_insert_leave = 0	 " only lint on save
let g:ale_lint_on_enter = 0		 " only lint on save

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Templates
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd BufNewFile *.html 0r ~/.vim_templates/base.html

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Shiftwidth, tabstop, softtabstop
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd FileType html set sw=2
autocmd FileType html set ts=2
autocmd FileType html set sts=2
