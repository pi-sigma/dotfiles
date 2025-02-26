local actions = require("telescope.actions")
local builtin = require("telescope.builtin")
local map = require("utils").map

require("plenary")

require("telescope").setup({
    opts = {
        map("n", "<a-f>", builtin.find_files, {}),
        map("n", "<leader><a-f>", builtin.live_grep, {}),
        map("n", "<leader>rf", builtin.lsp_references, {}),
        map("n", "<leader>gg", builtin.lsp_implementations, {}),
        map("n", "<leader>gf", builtin.lsp_definitions, {}),
        map("n", "<leader>b", builtin.buffers, {}),
        map(
            "n",
            "<leader>fw",
            ":lua require('telescope.builtin').grep_string({search = vim.fn.expand('<cword>')})<cr>",
            {desc = "Grep word under cursor"}
        ),
        map(
            "n",
            "<leader>ff",
            ":lua require('telescope.builtin').grep_string({ shorten_path = true, word_match = '-w', only_sort_text = true, search = '' })<cr>",
            {desc = "Fuzzy find string"}
        ),
        map(
            "n",
            "<leader>ff",
            ":lua require'telescope.builtin'.grep_string()<CR>",
            {desc = "Go to definition, open in vertical split"}
        ),
        map(
            "n",
            "<leader>fr",
            ":Telescope resume<CR>",
            {desc = "Resume previous search"}
        ),
        map(
            'n',
            '<leader>dv',
            ':lua require"telescope.builtin".lsp_definitions({jump_type="vsplit"})<CR>',
            {desc = 'Go to definition, open in vertical split'}
        ),
        map(
            'n',
            '<leader>dh',
            ':lua require"telescope.builtin".lsp_definitions({jump_type="split"})<CR>',
            {desc = 'Go to definition, open in horizontal split'}
        ),
        map(
            "n",
            "<leader>S",
            ":lua require('telescope.builtin').lsp_document_symbols({ symbols={'class', 'method', 'function'} })<CR>",
            {desc = "List symbols (class, method, function)"}
        ),
    },
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
})
