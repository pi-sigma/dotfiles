return {
    'nvim-telescope/telescope.nvim',

    dependencies = {'nvim-lua/plenary.nvim'},

    init = function()
        local builtin = require("telescope.builtin")

        vim.keymap.set("n", "<a-f>", builtin.find_files, {})
        vim.keymap.set("n", "<leader><a-f>", builtin.live_grep, {})
        vim.keymap.set("n", "<leader>rf", builtin.lsp_references, {})
        vim.keymap.set("n", "<leader>gg", builtin.lsp_implementations, {})
        vim.keymap.set("n", "<leader>gf", builtin.lsp_definitions, {})
    end,

    config = function()
        local actions = require("telescope.actions")

        require("telescope").setup({
            defaults = {
                file_ignore_patterns = {
                    "build", "dist", "node_modules", "yarn.lock",
                },
                mappings = {
                    i = {
                        ["<C-h>"] = "which_key",
                        ["<leader>q"] = actions.close,
                    }
                },
            },
            vim.keymap.set("n", "<a-f>", ":lua require'telescope.builtin'.find_files{}<cr>", {}),
            vim.keymap.set(
                "n",
                "<leader>sF",
                ":lua require('telescope.builtin').grep_string({search = vim.fn.expand('<cword>')})<cr>", {}
            ),
            vim.keymap.set(
                "n",
                "<leader>ff",
                ":lua require('telescope.builtin').grep_string({ shorten_path = true, word_match = '-w', only_sort_text = true, search = '' })<cr>",
                {}
            ),
        })
    end,
}
