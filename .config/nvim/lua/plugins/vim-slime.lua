vim.g.slime_target = 'x11'
vim.g.slime_no_mappings = 1

local opts = { silent = true}

vim.keymap.set("x", "<leader>S", "<Plug>SlimeRegionSend", opts)
vim.keymap.set("n", "<leader>S", "<Plug>SlimeMotionSend", opts)
vim.keymap.set("n", "<leader>ss", "<Plug>SlimeLineSend", opts)
