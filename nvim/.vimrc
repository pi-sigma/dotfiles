call plug#begin('~/.local/share/nvim/plugged')
" General
Plug 'tpope/vim-sensible'

" Display
Plug 'flazz/vim-colorschemes'
Plug 'guns/xterm-color-table.vim'
Plug 'morhetz/gruvbox'
Plug 'sainnhe/gruvbox-material'
Plug 'nvim-treesitter/playground'
Plug 'xolox/vim-colorscheme-switcher'
Plug 'xolox/vim-misc'
Plug 'Yggdroot/indentLine'

" Editing/navigating/searching
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-commentary'
Plug 'junegunn/fzf', { 'dir': '~/opt/fzf' }
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
" Plug 'jesseleite/vim-agriculture'
Plug 'alvan/vim-closetag'
Plug 'jeetsukumaran/vim-buffergator'
Plug 'justinmk/vim-sneak'
Plug 'tpope/vim-surround'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/nvim-treesitter-textobjects'
Plug 'yilin-yang/vim-markbar'
Plug 'gcmt/taboo.vim'

" LSP Support
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'
Plug 'VonHeikemen/lsp-zero.nvim'

" Autocompletion
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-nvim-lua'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/nvim-cmp'
Plug 'saadparwaiz1/cmp_luasnip'

" Snippets
Plug 'L3MON4D3/LuaSnip'
" Plug 'rafamadriz/friendly-snippets'

" Testing & debugging
Plug 'sakhnik/nvim-gdb', { 'do': ':!./install.sh' }
Plug 'vim-test/vim-test'

" Language-specific
Plug 'vim-scripts/python_match.vim'
Plug 'vim-python/python-syntax'
Plug 'maxmellon/vim-jsx-pretty'

" Git
Plug 'junegunn/gv.vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'

" Other
Plug 'preservim/vimux'
call plug#end()


"""""""""""""""""
" Plugin config "
"""""""""""""""""
" Buffergator
let g:buffergator_viewport_split_policy = "B"

" Colorscheme
" let g:gruvbox_material_background = 'medium'
" let g:gruvbox_material_better_performance = 1
" let g:gruvbox_material_ui_contrast = 'low'
" colorscheme gruvbox-material
colorscheme gruvbox
hi function ctermfg=108

" hi DiagnosticError ctermfg=9
" hi DiagnosticWarn ctermfg=11

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

" Python
let g:python_highlight_builtins = 1
let g:python_highlight_func_calls = 1
let g:python_highlight_class_vars = 1
let g:python_highlight_builtin_types = 1
let g:python3_host_prog = '/usr/bin/python'

" Vim test
let test#python#runner = 'djangotest'
" let test#project_root = ''
nmap <silent> <leader>t :TestNearest<CR>
nmap <silent> <leader>T :TestFile<CR>
nmap <silent> <leader>a :TestSuite<CR>
nmap <silent> <leader>l :TestLast<CR>
nmap <silent> <leader>g :TestVisit<CR>

" Lua/LSP
lua require('config')
inoremap <C-x><C-x> <Cmd>lua require('cmp').complete()<CR>


""""""""""""""""""""
" General settings "
""""""""""""""""""""
syntax on
set relativenumber
set number
set signcolumn=number
set scrolloff=999
set laststatus=2
set hidden  " hide buffers (instead of closing)
set ignorecase
set smartcase
set incsearch
set noswapfile
set completeopt-=preview  " no scratch buffers on autocomplete
set completeopt-=menu[one]
set foldmethod=manual
set foldnestmax=10
set nofoldenable
set foldlevel=2

""""""""""""
" Mappings "
""""""""""""
nmap Q <Nop>
vnoremap <C-c> "+y

" Buffer
" nnoremap <Leader>b :buffers<CR>:buffer<Space>
" nnoremap <Leader>v :buffers<CR>:vert sbuffer<Space>

" fuzzy find
nmap <A-f> :FZF<CR>

" :nohlsearch
nnoremap <silent> <Esc><Esc> :let @/ = ""<CR>

" Open windows on the bottom & to the right by default
set splitbelow splitright

" Simplify split navigation
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k

" Simplify adjusting split size
noremap <silent> <A-Right> :vertical resize +3<CR>
noremap <silent> <A-Left> :vertical resize -3<CR>
noremap <silent> <A-Up> :resize -3<CR>
noremap <silent> <A-Down> :resize +3<CR>

" Convert horizontal and vertical splits
nmap <leader>tk <C-w>t<C-w>H
nmap <leader>th <C-w>t<C-w>K

" Split terminal (horizontal, vertical, bottom)
noremap <leader>termh :split<cr>:term<cr>
" noremap <leader>terv :vsplit<cr>:term<cr>
noremap <leader>termv :vsplit<cr>:term<cr>
nnoremap <leader>termb :sp<bar>term<cr><c-w>J:resize15<cr>

" Copy & paste to/from clipboard (https://github.com/vim/vim/issues/5157)
xnoremap "+y y:call system("wl-copy", @")<cr>
nnoremap "+p :let @"=substitute(system("wl-paste --no-newline"), '<C-v><C-m>', '', 'g')<cr>p
nnoremap "*p :let @"=substitute(system("wl-paste --no-newline --primary"), '<C-v><C-m>', '', 'g')<cr>p

" Shortcut to edit vim/nvim config
nnoremap <silent> <leader>nv :e ~/.dotfiles/nvim/.vimrc<CR>

" Silver Searcher shortcuts
nnoremap <silent> <Leader>ag :Ag <C-R><C-W><CR>
" exact search
noremap <leader>AG :AgRaw! -w -Q -s <C-r>=expand('<cword>')<CR><CR>


"""""""""""""
" Templates "
"""""""""""""
autocmd BufNewFile *.html 0r ~/.vim_templates/base.html

""""""""""""""""""""""""""""""""""""
" Shiftwidth, tabstop, softtabstop "
""""""""""""""""""""""""""""""""""""
autocmd FileType html,javascript,vim set sw=2
autocmd FileType html,javascript,vim set ts=2
autocmd FileType html,javascript,vim set sts=2
autocmd FileType lua set sw=3
autocmd FileType lua set ts=3
autocmd FileType lua set sts=3
autocmd FileType c,sh set sw=4
autocmd FileType c,sh set ts=4
autocmd FileType c,sh set sts=4

""""""""""""""
" Statusline "
""""""""""""""
set statusline+=%f\ \ %m%=%{&filetype}\ \|
set statusline+=\ %{&fileencoding?&fileencoding:&encoding}\ \|
set statusline+=\ %{&fileformat}\ \ 
set statusline+=\ %p%%\ \ 
set statusline+=\ %l:%c
