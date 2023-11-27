return {
    -- {
    --     "voldikss/vim-floaterm",
    --     event = "VeryLazy",
    --     config = function ()
    --         vim.keymap.set("n", "<leader>ftt", ":FloatermToggle<CR>", {})
    --         vim.keymap.set("n", "<leader>ftn", ":FloatermNew<CR>", {})
    --         vim.keymap.set("n", "<leader>fth", ":FloatermHide<CR>", {})
    --         vim.keymap.set("n", "<leader>ftk", ":FloatermKill<CR>", {})
    --         vim.keymap.set("n", "<leader>ftt", ":FloatermToggle<CR>", {})

    --         -- mappings to move out from terminal to other views
    --         vim.keymap.set('t', '<C-h>', '<C-\\><C-n><C-w>h')
    --         -- Close terminal window, even if we are in insert mode
    --         vim.keymap.set('t', '<leader>q', '<C-\\><C-n>:q<cr>')
    --     end
    -- },

    {
        's1n7ax/nvim-terminal',
        config = function()
            vim.o.hidden = true
            require('nvim-terminal').setup()

            -- mappings to move out from terminal to other views
            vim.keymap.set('t', '<C-h>', '<C-\\><C-n><C-w>h')
            -- Close terminal window, even if we are in insert mode
            vim.keymap.set('t', '<leader>q', '<C-\\><C-n>:q<cr>')
        end,

        opts = {}
    },
}
