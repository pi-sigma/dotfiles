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
Plug 'junegunn/fzf', { 'do': { -> fzf#install() }, 'on': 'FZF' }
Plug 'junegunn/fzf.vim', { 'on': 'FZF' }
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'tpope/vim-surround'
Plug 'justinmk/vim-sneak'
Plug 'machakann/vim-swap'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}

" LSP Support
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'
Plug 'VonHeikemen/lsp-zero.nvim'

" Autocompletion
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-nvim-lua'

" Snippets
Plug 'L3MON4D3/LuaSnip'
" Plug 'rafamadriz/friendly-snippets'

" Other
Plug 'vim-scripts/python_match.vim'
Plug 'tpope/vim-fugitive'
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
nnoremap <Leader>b :buffers<CR>:buffer<Space>
nnoremap <Leader>v :buffers<CR>:vert sbuffer<Space>

" fuzzy find
nmap <A-f> :FZF<CR>

" :nohlsearch
nnoremap <silent> <Esc><Esc> :let @/ = ""<CR>

" Parentheses, brackets, braces; double quotes, single quotes, ticks
vnoremap $! <esc>`>a)<esc>`<i(<esc>
vnoremap $@ <esc>`>a]<esc>`<i[<esc>
vnoremap $# <esc>`>a}<esc>`<i{<esc>
vnoremap $$ <esc>`>a"<esc>`<i"<esc>
vnoremap $% <esc>`>a'<esc>`<i'<esc>
vnoremap $^ <esc>`>a`<esc>`<i`<esc>

" Open windows on the bottom & to the right by default
set splitbelow splitright

" Simplify split navigation
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k

" Simplify adjusting split size
noremap <silent> <C-Right> :vertical resize +3<CR>
noremap <silent> <C-Left> :vertical resize -3<CR>
noremap <silent> <C-Up> :resize +3<CR>
noremap <silent> <C-Down> :resize -3<CR>

" Convert horizontal and vertical splits
nmap <leader>tk <C-w>t<C-w>H
nmap <leader>th <C-w>t<C-w>K

" Copy & paste to/from clipboard (https://github.com/vim/vim/issues/5157)
xnoremap "+y y:call system("wl-copy", @")<cr>
nnoremap "+p :let @"=substitute(system("wl-paste --no-newline"), '<C-v><C-m>', '', 'g')<cr>p
nnoremap "*p :let @"=substitute(system("wl-paste --no-newline --primary"), '<C-v><C-m>', '', 'g')<cr>p

" Shortcut to edit vim/nvim config
nnoremap <silent> <leader>nv :e ~/.dotfiles/nvim/.vimrc<CR>

"""""""""""""
" Templates "
"""""""""""""
autocmd BufNewFile *.html 0r ~/.vim_templates/base.html

""""""""""""""""""""""""""""""""""""
" Shiftwidth, tabstop, softtabstop "
""""""""""""""""""""""""""""""""""""
autocmd FileType c,lua,sh set sw=4
autocmd FileType c,lua,sh set ts=4
autocmd FileType c,lua,sh set sts=4
autocmd FileType html,vim set sw=2
autocmd FileType html,vim set ts=2
autocmd FileType html,vim set sts=2

""""""""""""""
" Statusline "
""""""""""""""
set statusline+=%f\ \ %{FugitiveStatusline()}\ \ %m%=%{&filetype}\ \|
set statusline+=\ %{&fileencoding?&fileencoding:&encoding}\ \|
set statusline+=\ %{&fileformat}\ \ 
set statusline+=\ %p%%\ \ 
set statusline+=\ %l:%c
