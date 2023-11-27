return {
    {
       "mickael-menu/zk-nvim",
        event = "VeryLazy",
        config = function ()
            require("zk").setup({
                picker = "fzf",
                lsp = {
                    config = {
                        cmd = { "zk", "lsp" },
                        name = "zk",
                    },
                    auto_attach = {
                        enabled = true,
                        filetypes = { "markdown" },
                    },
                }
            })

            -- keymaps
            vim.keymap.set("n", "<leader>zl", ":FollowLink<CR>", {})
            vim.keymap.set("n", "<leader>zb", ":ZkBacklinks<CR>", {})

            if require("zk.util").notebook_root(vim.fn.expand('%:p')) ~= nil then
               local function map(...) vim.api.nvim_buf_set_keymap(0, ...) end

               local opts = { noremap = true, silent = false }

               -- Create a new note after asking for its title.
               map("n", "<leader>zn", "<Cmd>ZkNew { dir = vim.fn.expand('%:p:h'), title = vim.fn.input('Title: ') }<CR>", opts)
               -- Create a new note in the same directory as the current buffer, using the current selection for title.
               map("v", "<leader>znt", ":'<,'>ZkNewFromTitleSelection { dir = vim.fn.expand('%:p:h') }<CR>", opts)

               -- Open notes linking to the current buffer.
               map("n", "<leader>zb", "<Cmd>ZkBacklinks<CR>", opts)
               -- Alternative for backlinks using pure LSP and showing the source context.
               --map('n', '<leader>zb', '<Cmd>lua vim.lsp.buf.references()<CR>', opts)
               -- Open notes linked by the current buffer.
               map("n", "<leader>zL", "<Cmd>ZkLinks<CR>", opts)

               -- Preview a linked note.
               map("n", "<leader>zp", "<Cmd>lua vim.lsp.buf.hover()<CR>", opts)
            end
        end
    }
}
