return {
    {
        "preservim/nerdtree",
        event = "VeryLazy",
        config = function ()
            vim.keymap.set("n", "<leader>nn", ": NERDTreeCWD<CR>", { silent = true })
            vim.keymap.set("n", "<leader>nf", ": NERDTreeFind<CR>", { silent = true })
            vim.g.NERDTreeQuitOnOpen = 3
            vim.g.NERDTreeCustomOpenArgs = {file = {reuse = "currenttab"}}
        end
    }
}
