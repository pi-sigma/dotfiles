""""""""""""""""""""
" General mappings "
""""""""""""""""""""
let mapleader = ","

nmap Q <Nop>
vnoremap <C-c> "+y

" save
nnoremap <leader>w :update<cr>

" :nohlsearch
nnoremap <silent> <Esc><Esc> :let @/ = ""<cr>

" half-page up/down
nnoremap J <C-d>
nnoremap K <C-u>

" search word under cursor without moving cursor
nnoremap <C-D> *N

" move lines
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

" delete to "black hole" + yank
xnoremap <leader>p "_dP

" convert horizontal and vertical splits
nnoremap <leader>sh :windo wincmd K<cr>
nnoremap <leader>sv :windo wincmd H<cr>

" simplify adjusting split size
noremap <silent> <a-right> :vertical resize +3<cr>
noremap <silent> <a-left> :vertical resize -3<cr>
noremap <silent> <a-up> :resize -3<cr>
noremap <silent> <a-down> :resize +3<cr>

" split terminal (horizontal, vertical, bottom)
noremap <leader>termh :split<cr>:term<cr>
noremap <leader>termv :vsplit<cr>:term<cr>
nnoremap <leader>termb :sp<bar>term<cr><c-w>j:resize15<cr>

" copy & paste to/from clipboard (https://github.com/vim/vim/issues/5157)
xnoremap "+y y:call system("wl-copy", @")<cr>
nnoremap "+p :let @"=substitute(system("wl-paste --no-newline"), '<c-v><c-m>', '', 'g')<cr>p
nnoremap "*p :let @"=substitute(system("wl-paste --no-newline --primary"), '<c-v><c-m>', '', 'g')<cr>p

" shortcuts to edit nvim config files
nnoremap <silent> <leader>nvi :e ~/.dotfiles/nvim/init.vim<cr>
nnoremap <silent> <leader>nvp :e ~/.dotfiles/nvim/plugins.vim<cr>
nnoremap <silent> <leader>nvc :e ~/.dotfiles/nvim/config.vim<cr>
nnoremap <silent> <leader>nvf :e ~/.dotfiles/nvim/functions.vim<cr>
nnoremap <silent> <leader>nvm :e ~/.dotfiles/nvim/mappings.vim<cr>
nnoremap <silent> <leader>nvl :e ~/.dotfiles/nvim/config.lua<cr>

" delete marks
nnoremap <silent> <leader>dm :delm! | delm A-Z0-9<cr>

" tabs
nnoremap <leader>tt :tabnew<cr>

"""""""""""
" plugins "
"""""""""""
" Bbye
nnoremap <Leader>q :bdelete<CR>
nnoremap <Leader>Q :Bdelete<CR>

" File explorer
nnoremap <leader>nn :NERDTreeCWD<cr>

" fuzzy find
nnoremap <a-F> :FZF<cr>
nnoremap <leader>b :Buffers<cr>

" harpoon
nnoremap <leader>h :lua require("harpoon.ui").toggle_quick_menu()<cr>
nnoremap <leader>H :lua require("harpoon.mark").add_file()<cr>

" ripgrep
" nnoremap <a-F> :Rg<cr>

" floaterm
nnoremap <leader>ftn :FloatermNew<cr>
nnoremap <leader>ft+ :FloatermNext<cr>
nnoremap <leader>fth :FloatermHide<cr>
nnoremap <leader>ftk :FloatermKill<cr>
nnoremap <leader>ftt :FloatermToggle<cr>

" telescope & fzf
nnoremap <a-f> :lua require'telescope.builtin'.find_files{}<cr>
nnoremap <leader><a-f> :lua require'telescope.builtin'.live_grep{}<cr>
nnoremap <leader><a-F> :lua require'telescope.builtin'.live_grep{ search_dirs = {'$VIRTUAL_ENV/lib/',}}<cr>
nnoremap <leader>sF <cmd>lua require('telescope.builtin').grep_string({search = vim.fn.expand("<cword>")})<cr>
nnoremap <Leader>ff :lua require'telescope.builtin'.grep_string{ shorten_path = true, word_match = "-w", only_sort_text = true, search = '' }<cr>
nnoremap <Leader>rf :lua require'telescope.builtin'.lsp_references{}<cr>
nnoremap <Leader>gg :lua require'telescope.builtin'.lsp_implementations{}<cr>
nnoremap <Leader>gf :lua require'telescope.builtin'.lsp_definitions{}<cr>

" testing
nnoremap <silent> <leader>tn :TestNearest<cr>
nnoremap <silent> <leader>TN :TestNearest --keepdb<cr>
nnoremap <silent> <leader>tl :TestLast<cr>
nnoremap <silent> <leader>tf :TestFile<cr>

" undotree
nnoremap <F5> :UndotreeToggle<CR>
nnoremap <leader>ud :UndotreeToggle<CR>

" vim-surround
nmap <leader>)) ysiw)
nmap <leader>]] ysiw]]
nmap <leader>}} ysiw}
nmap <leader>(( ysiw(
nmap <leader>[[ ysiw[
nmap <leader>{{ ysiw{
nmap <leader>"" ysiw"
nmap <leader>'' ysiw'

" visual-multi
let g:VM_maps = {}
let g:VM_maps['Find Under'] = '<A-w>'

" zk
nnoremap <leader>zl :FollowLink<CR>
nnoremap <leader>zb :ZkBacklinks<CR>
