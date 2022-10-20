call plug#begin('~/.local/share/nvim/plugged')
" General
Plug 'tpope/vim-sensible'

" Display
Plug 'morhetz/gruvbox'
Plug 'Yggdroot/indentLine'

" Editing + navigating
Plug 'jiangmiao/auto-pairs'
Plug 'alvan/vim-closetag'
Plug 'tpope/vim-commentary'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-surround'
Plug 'justinmk/vim-sneak'
Plug 'machakann/vim-swap'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}

" Analysis + linting
Plug 'dense-analysis/ale'

" Language-specific
Plug 'vim-scripts/python_match.vim'
Plug 'python-rope/rope'
Plug 'python-rope/ropevim'
call plug#end()

"""""""""""""""""
" Plugin config "
"""""""""""""""""
" Colorscheme
colorscheme gruvbox
let g:gruvbox_contrast_dark = 'hard'

" Indentline
let g:indentLine_char_list = ['|', '¦', '┆', '┊']

" Vim-Closetag
let g:closetag_filenames = '*.html,*.xhtml,*.phtml'
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx'
let g:closetag_filetypes = 'html,xhtml,phtml'
let g:closetag_xhtml_filetypes = 'xhtml,jsx'
let g:closetag_shortcut = '>'
" Add > at current position without closing the current tag, default is ''
let g:closetag_close_shortcut = '<leader>>'

" Ale
let b:ale_linters = ['cc', 'pylint']
let g:ale_linters_ignore = ['mypy', 'flake8']
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_insert_leave = 0
let g:ale_lint_on_enter = 0


""""""""""""""""""""
" General settings "
""""""""""""""""""""
syntax on
set relativenumber
set signcolumn=number
set scrolloff=999
set laststatus=2
set hidden
set ignorecase
set smartcase
set incsearch
set noswapfile

""""""""""""
" Mappings "
""""""""""""
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

" Simplify (horizontal) split navigation
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" Simplify adjusting split size
noremap <silent> <C-Right> :vertical resize +3<CR>
noremap <silent> <C-Left> :vertical resize -3<CR>
noremap <silent> <C-Up> :resize +3<CR>
noremap <silent> <C-Down> :resize -3<CR>

" Ctags
nnoremap <C-q> :execute "vertical ptag " . expand("<cword>")<CR>
set previewheight=95

" Shortcut to edit vim/nvim config
nnoremap <silent> <leader>nv :e ~/.dotfiles/dotfiles/.vimrc<CR>

"""""""""""""
" Templates "
"""""""""""""
autocmd BufNewFile *.html 0r ~/.vim_templates/base.html

""""""""""""""""""""""""""""""""""""
" Shiftwidth, tabstop, softtabstop "
""""""""""""""""""""""""""""""""""""
autocmd FileType c,sh set sw=4
autocmd FileType c,sh set ts=4
autocmd FileType c,sh set sts=4
autocmd FileType html,vim set sw=2
autocmd FileType html,vim set ts=2
autocmd FileType html,vim set sts=2
