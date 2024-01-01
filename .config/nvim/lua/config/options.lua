-- gutter/line numbers
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.signcolumn = "number"   -- show current line number in gutter

-- folding
vim.opt.foldmethod = "manual"
vim.opt.foldlevel = 99
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
-- vim.opt.foldnestmax = 10

-- splits
vim.opt.splitbelow = true
vim.opt.splitright = true

-- smart search (sensitive for upper-case, non-sensitive for lower-case)
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.incsearch = true
vim.opt.swapfile = false

-- tabs > spaces
vim.opt.expandtab = true

-- center view
vim.opt.scrolloff = 999

-- permanent statusline
vim.opt.laststatus = 2

-- hide buffers instead of deleting them
vim.opt.hidden = true

-- scrolling performance
vim.opt.ttyfast = true

-- prevent hiding of symbols in yaml, json, etc.
vim.opt.conceallevel = 0

-- resize windows
vim.opt.equalalways = true

-- statusline
vim.opt.statusline = "%f %m%= %{&filetype?&filetype:&filetype}  %p%%  %l:%c "

-- file search across directories
vim.opt.path:append "**"

-- extend session options to save tab names
vim.opt.sessionoptions = "globals,buffers,curdir,tabpages,help,winpos"
