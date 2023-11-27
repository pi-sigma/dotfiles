vim.opt.syntax = "on"

-- gutter/line numbers
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.signcolumn = "number"   -- show current line number in gutter

-- folding
vim.opt.foldmethod = "manual"
vim.opt.foldlevel = 2
vim.opt.foldnestmax = 10

-- splits
vim.opt.splitbelow = true
vim.opt.splitright = true

-- smart search (sensitive for upper-case, non-sensitive for lower-case)
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.incsearch = true
vim.opt.swapfile = false
vim.opt.expandtab = true        -- tabs > spaces
vim.opt.scrolloff = 999         -- center view
vim.opt.laststatus = 2          -- permanent statusline
vim.opt.hidden = true           -- hide buffers instead of deleting them
vim.opt.ttyfast = true          -- scrolling performance
vim.opt.conceallevel = 0        -- prevent hiding of symbols in yaml, json, etc.
vim.opt.equalalways = true      -- resize windows

-- shiftwidth, tabstop, softtabstop
vim.api.nvim_create_autocmd("FileType", {
    pattern = {
        "c", "css", "html", "htmldjango", "javascript", "json", "lua", "scss", "yaml", "vim",
    },
    callback = function()
        vim.opt.shiftwidth = 4
        vim.opt.tabstop = 4
        vim.opt.softtabstop = 4
    end
})

-- line-wrap
vim.api.nvim_create_autocmd("FileType", {
    pattern = { "markdown" },
    callback = function()
        vim.opt_local.wrap = true
        vim.opt_local.textwidth = 80
    end
})

-- statusline
vim.opt.statusline = "%f %m%= %{&filetype?&filetype:&filetype}  %p%%  %l:%c "
