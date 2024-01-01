local opts = { silent = true }

vim.g.mapleader = ","

-- save
vim.keymap.set("n", "<leader>w", ":update<CR>", {})

vim.keymap.set("n", "Q", "<Nop>", {})

-- nohlsearch
vim.keymap.set("n", "<Esc><Esc>", ":let @/ = ''<CR>", opts)

-- half-page up/down
vim.keymap.set("n", "J", "<C-d>", {})
vim.keymap.set("n", "K", "<C-u>", {})

-- select word under cursor
vim.keymap.set("n", "<A-w>", "viw", {})

-- search word under cursor without moving cursor
vim.keymap.set("n", "<C-D>", "*N", {})

-- move lines
vim.keymap.set("n", "<A-j>", ":m .+1<CR>==", opts)
vim.keymap.set("n", "<A-k>", ":m .-2<CR>==", opts)
vim.keymap.set("i", "<A-j> <Esc>", ":m .+1<CR>==gi", opts)
vim.keymap.set("i", "<A-K> <Esc>", ":m .-2<CR>==gi", opts)
vim.keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv", opts)
vim.keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv", opts)

-- convert horizontal/vertical splits
vim.keymap.set("n", "<leader>sh", ":windo wincmd K<CR>", opts)
vim.keymap.set("n", "<leader>sv", ":windo wincmd H<CR>", opts)

-- adjust split size
vim.keymap.set("n", "<a-right>", ":vertical resize +3", opts)
vim.keymap.set("n", "<a-left>", ":vertical resize -3", opts)
vim.keymap.set("n", "<a-up>", ":resize -3", opts)
vim.keymap.set("n", "<a-down>", ":resize +3", opts)

-- split terminal (vertical, bottom)
vim.keymap.set("n", "<leader>termv", ":vsplit<CR>:term<CR>", opts)
vim.keymap.set("n", "<leader>termb", ":sp<bar>term<CR><C-W>j:resize15<CR>", opts)

-- tabs
vim.keymap.set("n", "<leader>tt", ":tabnew<CR>", opts)

-- yank/paste
vim.keymap.set('', '<C-c>', '"+y', {desc = "Yank to clipboard", silent = true})
vim.keymap.set('', '<C-v>', '"+p', {desc = "Paste after cursor from clipboard", silent = true})
vim.keymap.set('', '<leader>Y', '"+y$', {desc = "Yank until EOL to clipboard", silent = true})
vim.keymap.set("n", "<leader>0", '"+p', {desc = "Paste from 0 register", silent = true})
vim.keymap.set("v", "<leader>0", '"+p', {desc = "Paste from 0 register", silent = true})
