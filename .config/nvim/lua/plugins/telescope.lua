local actions = require("telescope.actions")
local builtin = require("telescope.builtin")
local map = require("utils").map

require("plenary")

require("telescope").setup({
    opts = {
        map("n", "<a-f>", builtin.find_files, {}),
        map("n", "<leader>rf", builtin.lsp_references, {}),
        map("n", "<leader>gg", builtin.lsp_implementations, {}),
        map("n", "<leader>gf", builtin.lsp_definitions, {}),
        map("n", "<leader>b", builtin.buffers, {}),
        map("n", "<leader><a-f>", function()
            builtin.live_grep({
                additional_args = function()
                    return {
                        "--glob=!package-lock.json",
                        "--glob=!LICENSE.md",
                    }
                end
            })
            end,
            { desc = "Live grep (ignoring package-lock.json and similar files)" }
        ),
        map("n", "<leader>fw", function ()
            builtin.grep_string({
                search = vim.fn.expand('<cword>')
            })
            end,
            { desc = "Grep word under cursor" }
        ),
        map("n", "<leader>ff", function ()
            builtin.grep_string({
                shorten_path = true,
                word_match = "-w",
                only_sort_text = true,
            })
            end,
            { desc = "Fuzzy find string surrounding cursor" }
        ),
        map("n", "<leader>dv", function ()
            builtin.lsp_definitions({
                jump_type="vsplit"
            })
            end,
            { desc = "Go to definition, open in vertical split" }
        ),
        map("n", "<leader>dh", function ()
            builtin.lsp_definitions({
                jump_type="split"
            })
            end,
            { desc = "Go to definition, open in horizontal split" }
        ),
        map("n", "<leader>fr", ":Telescope resume<CR>", { desc = "Resume previous search" }),
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
