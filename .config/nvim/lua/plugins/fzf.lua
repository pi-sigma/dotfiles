return {
    {
        "junegunn/fzf",
        build = "./install --bin",
        config = function ()
            vim.keymap.set("n", "<a-F>", ":FZF<CR>", {})
            -- vim.keymap.set("n", "<leader>b", ":Buffers<cr>", {})
        end
    },
    {
        "junegunn/fzf.vim",
        config = function ()
            vim.g.fzf_layout = { window = { width = 0.9, height = 0.8 } }
            -- vim.g.fzf_preview_window = {right = "50%"}
        end
    },
}
