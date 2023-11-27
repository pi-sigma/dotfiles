-- functions
vim.api.nvim_set_hl(0, "@function", {ctermfg = 108})
vim.api.nvim_set_hl(0, "@function.call", {ctermfg = 108})
vim.api.nvim_set_hl(0, "@function.builtin", {ctermfg = 108})
vim.api.nvim_set_hl(0, "@parameter", {ctermfg = 223})

-- operators
vim.api.nvim_set_hl(0, "@operator", {ctermfg = 167})

-- types
vim.api.nvim_set_hl(0, "@type", {ctermfg = 214})
vim.api.nvim_set_hl(0, "@type.builtin", {ctermfg = 214})
vim.api.nvim_set_hl(0, "@type.qualifier", {ctermfg = 175})

-- attributes
vim.api.nvim_set_hl(0, "@attribute", {ctermfg = 108})
vim.api.nvim_set_hl(0, "@attribute.builtin", {ctermfg = 108})

-- constants + variables
vim.api.nvim_set_hl(0, "@constant.builtin", {ctermfg = 175})
vim.api.nvim_set_hl(0, "@variable.builtin", {ctermfg = 223})

-- data types
vim.api.nvim_set_hl(0, "@boolean", {ctermfg = 175})
vim.api.nvim_set_hl(0, "@number", {ctermfg = 223})
vim.api.nvim_set_hl(0, "@float", {ctermfg = 223})
vim.api.nvim_set_hl(0, "@string", {ctermfg = 2})

-- other
vim.api.nvim_set_hl(0, "@error", {ctermfg = 223})