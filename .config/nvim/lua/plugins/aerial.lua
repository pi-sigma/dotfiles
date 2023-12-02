return {
    "stevearc/aerial.nvim",
    event = "VeryLazy",
    config = function()
        require('aerial').setup({
            on_attach = function(bufnr)
                -- jump forwards/backwards with '{' and '}'
                vim.keymap.set('n', '{', '<cmd>aerialprev<cr>', { buffer = bufnr })
                vim.keymap.set('n', '}', '<cmd>aerialnext<cr>', { buffer = bufnr })
                vim.keymap.set('n', '<leader>ae', '<cmd>AerialToggle<CR>')
            end,
            layout = {
               max_width = { 40, 0.2 },  -- the lesser of 40 columns or 20% of total
               width = nil,
               min_width = 30,
               default_direction = "prefer_left",
               placement = "window",
               preserve_equality = false,
            },
        })
    end
}
