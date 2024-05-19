local function map(mode, lhs, rhs, opts)
    local options = {noremap = true, silent = true}

    if opts then
      options = vim.tbl_extend("force", options, opts)
    end

    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

vim.g.mapleader = ","

-- save
map("n", "<leader>w", ":update<CR>", {silent = false})

map("n", "Q", "<Nop>")

-- nohlsearch
map("n", "<Esc><Esc>", ":let @/ = ''<CR>")

-- search word under cursor without moving cursor
map("n", "<A-w>", "*N", {})

-- move lines
map("n", "<A-j>", ":m .+1<CR>==")
map("n", "<A-k>", ":m .-2<CR>==")
map("i", "<A-j> <Esc>", ":m .+1<CR>==gi")
map("i", "<A-K> <Esc>", ":m .-2<CR>==gi")
map("v", "<A-j>", ":m '>+1<CR>gv=gv")
map("v", "<A-k>", ":m '<-2<CR>gv=gv")

-- convert horizontal/vertical splits
map("n", "<leader>sh", ":windo wincmd K<CR>")
map("n", "<leader>sv", ":windo wincmd H<CR>")

-- adjust split size
map("n", "<a-right>", ":vertical resize +3")
map("n", "<a-left>", ":vertical resize -3")
map("n", "<a-up>", ":resize -3")
map("n", "<a-down>", ":resize +3")

-- split terminal (vertical, bottom)
map("n", "<leader>termv", ":vsplit<CR>:term<CR>")
map("n", "<leader>termb", ":sp<bar>term<CR><C-W>j:resize15<CR>")

-- tabs
map("n", "<leader>tt", ":tabnew<CR>")

-- yank/paste
map('', '<C-c>', '"+y', {desc = "Yank to clipboard"})
map('', '<C-v>', '"+p', {desc = "Paste after cursor from clipboard"})
map('', '<leader>Y', '"+y$', {desc = "Yank until EOL to clipboard"})
map("n", "<leader>0", '"+p', {desc = "Paste from 0 register"})
map("v", "<leader>0", '"+p', {desc = "Paste from 0 register"})

-- quickfix list
map("n", "<leader>cn", ":cnext<CR>", {desc = "Goto next item on quckfix list"})
map("n", "<leader>cp", ":cprev<CR>", {desc = "Goto previous item on quckfix list"})
