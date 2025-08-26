-- helper function to swap textobjects
local swap_next, swap_prev = (function()
    local swap_objects = {
        p = "@parameter.inner",
        f = "@function.outer",
        c = "@class.outer",
    }
    local n, p = {}, {}

    for key, obj in pairs(swap_objects) do
        n[string.format("<A-n><A-%s>", key)] = obj
        p[string.format("<A-p><A-%s>", key)] = obj
    end

   return n, p
end)()

require("nvim-treesitter-textobjects")
require("nvim-treesitter-playground")
require("nvim-treesitter.configs").setup({
    ensure_installed = { "c", "css", "htmldjango", "javascript", "lua", "markdown", "python", "vim", "vimdoc", "yaml" },
    sync_install = false,
    auto_install = false,
    ignore_install = {"bash"},
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = true,
    },
    textobjects = {
        select = {
            enable = true,
            -- Automatically jump forward to textobj, similar to targets.vim
            lookahead = true,
            keymaps = {
                -- Use capture groups defined in textobjects.scm
                ["af"] = "@function.outer",
                ["if"] = "@function.inner",
                ["ac"] = "@class.outer",
                ["ic"] = "@class.inner",
                ["al"] = "@loop.outer",
                ["il"] = "@loop.inner",
            },
        },
        move = {
            enable = true,
            set_jumps = true,
            -- jump forward
            goto_next_start = {
                ["]f"] = "@function.outer",
                ["]c"] = { query = "@class.outer", desc = "Next class start" },
                ["]s"] = { query = "@scope", query_group = "locals", desc = "Next scope" },
                ["]z"] = { query = "@fold", query_group = "folds", desc = "Next fold" },
            },
            goto_next_end = {
                ["]F"] = "@function.outer",
                ["]C"] = "@class.outer",
            },
            goto_previous_start = {
                ["[f"] = "@function.outer",
                ["[c"] = "@class.outer",
            },
            goto_previous_end = {
                ["[F"] = "@function.outer",
                ["[C"] = "@class.outer",
            },
        },
        swap = {
            enable = true,
            swap_next = swap_next,
            swap_previous = swap_prev,
        },
        lsp_interop = {
            enable = true,
            border = "none",
            peek_definition_code = {
                ["<leader>df"] = "@function.outer",
                ["<leader>dc"] = "@class.outer"
            },
        },
    },
})
