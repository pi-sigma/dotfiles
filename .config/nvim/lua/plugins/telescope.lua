return {
    'nvim-telescope/telescope.nvim',

    dependencies = {'nvim-lua/plenary.nvim'},

    config = function()
        local builtin = require("telescope.builtin")
        local actions = require("telescope.actions")

        require("telescope").setup({

            vim.keymap.set("n", "<a-f>", builtin.find_files, {}),
            vim.keymap.set("n", "<leader><a-f>", builtin.live_grep, {}),
            vim.keymap.set("n", "<leader>rf", builtin.lsp_references, {}),
            vim.keymap.set("n", "<leader>gg", builtin.lsp_implementations, {}),
            vim.keymap.set("n", "<leader>gf", builtin.lsp_definitions, {}),
            vim.keymap.set("n", "<leader>b", builtin.buffers, {}),

            defaults = {
                file_ignore_patterns = {
                    "build", "dist", "node_modules", "yarn.lock",
                },
                mappings = {
                    n = {
                        ["<C-h>"] = "which_key",
                        ["<leader>q"] = actions.close,
                    },
                    i = {
                        ["<C-h>"] = "which_key",
                        ["<leader>q"] = actions.close,
                    },
                },
            },
            vim.keymap.set(
                "n",
                "<leader>sF",
                ":lua require('telescope.builtin').grep_string({search = vim.fn.expand('<cword>')})<cr>",
                {desc = "Grep word under cursor"}
            ),
            vim.keymap.set(
                "n",
                "<leader>ff",
                ":lua require('telescope.builtin').grep_string({ shorten_path = true, word_match = '-w', only_sort_text = true, search = '' })<cr>",
                {desc = "Fuzzy find string"}
            ),
            vim.keymap.set(
                "n",
                "<leader>S",
                ":lua require('telescope.builtin').lsp_document_symbols({ symbols={'class', 'method', 'function'} })<CR>",
                {desc = "List symbols (class, method, function)"}
            ),
        })
    end,
}
