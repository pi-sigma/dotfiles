""""""""""""""""""""
" General settings "
""""""""""""""""""""
syntax on
set relativenumber
set number
set expandtab
set signcolumn=number
set scrolloff=999
set laststatus=2
set hidden									" hide buffers (instead of closing)
set noequalalways						" automatic resize of split windows
set ignorecase
set smartcase
set incsearch
set noswapfile
set completeopt-=preview		" no scratch buffers on autocomplete
set completeopt-=menu[one]
set foldmethod=manual
set foldnestmax=10
set nofoldenable
set foldlevel=2
set splitbelow splitright		" Open windows on the bottom & to the right by default
set ttyfast
set conceallevel=0
set equalalways
" autocmd VimResized * wincmd =

"""""""""""""""""
" Plugin config "
"""""""""""""""""

" Ale
let g:ale_linters = {
\   'python': ['mypy'],
\}
let g:ale_virtualtext_cursor = 0
let g:ale_lint_on_text_changed = 'never' 
let g:ale_lint_on_enter = 0                                                                                                                                               
let g:ale_lint_on_save = 0
let g:ale_disable_lsp = 1
let g:ale_lint_on_insert_leave = 0

" Closetag
let g:closetag_filenames = '*.html,*.xhtml,*.phtml'
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx'
let g:closetag_filetypes = 'html,xhtml,phtml'
let g:closetag_xhtml_filetypes = 'xhtml,jsx'
let g:closetag_shortcut = '>'
" Add > at current position without closing the current tag, default is ''
let g:closetag_close_shortcut = '<leader>>'

" Colorscheme
" set termguicolors
let g:gruvbox_material_background = 'soft'
colorscheme gruvbox-material

" fzf
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.8 } }
" let g:fzf_preview_window = ['right:50%', 'ctrl-/']

" Neoformat
let g:neoformat_try_node_exe = 1

" Nerdtree
let g:NERDTreeQuitOnOpen=3
let NERDTreeCustomOpenArgs={'file':{'reuse':'currenttab'}}

" Testing
let test#python#runner = 'djangotest'
" let test#python#runner = 'pytest'
let test#project_root = '/home/pi-sigma/dev/'


"""""""""""""""""""""""""""""""
" File-type specific settings "
"""""""""""""""""""""""""""""""
" line-wrap
augroup WrapLineMarkdownFile
    autocmd!
    autocmd FileType markdown setlocal wrap 
		autocmd FileType markdown setlocal textwidth=80
augroup END

" Shiftwidth, tabstop, softtabstop
autocmd FileType css,html,htmldjango,javascript,json,scss,yaml,vim set sw=2
autocmd FileType css,html,htmldjango,javascript,json,scss,yaml,vim set ts=2
autocmd FileType css,html,htmldjango,javascript,json,scss,yaml,vim set sts=2
autocmd FileType lua set sw=3
autocmd FileType lua set ts=3
autocmd FileType lua set sts=3
autocmd FileType c,sh set sw=4
autocmd FileType c,sh set ts=4
autocmd FileType c,sh set sts=4
autocmd FileType sh set sw=2
autocmd FileType sh set ts=2
autocmd FileType sh set sts=2

""""""""""""""
" Statusline "
""""""""""""""
set statusline=%f
set statusline+=%m%=
" set statusline+=%{&filetype?&filetype:&filetype}\ \|\ 
set statusline+=%{&filetype?&filetype:&filetype}\ \ \ 
" set statusline+=%{&fileencoding?&fileencoding:&fileencoding}\ \|\  
" set statusline+=%{&fileformat?&fileformat:&fileformat}\ \ \ 
set statusline+=%p%%\ \ \ 
set statusline+=%l:%c

"""""""""""""
" Templates "
"""""""""""""
autocmd BufNewFile *.html 0r ~/.vim_templates/base.html
