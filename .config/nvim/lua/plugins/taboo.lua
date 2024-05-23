vim.cmd('let g:taboo_tab_format = " %N: %f%m "')
vim.cmd('let g:taboo_renamed_tab_format = " %N: [%l]%m "')

vim.api.nvim_set_keymap("n", "<leader>tr", ":TabooRename ", {noremap = true, silent = true})
