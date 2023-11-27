return {
    {
        "tpope/vim-surround",
        config = function ()
            vim.keymap.set("n", "<leader>}}", "ysiw}", {remap = true})
            vim.keymap.set("n", "<leader>{{", "ysiw{", {remap = true})
            vim.keymap.set("n", "<leader>))", "ysiw)", {remap = true})
            vim.keymap.set("n", "<leader>((", "ysiw(", {remap = true})
            vim.keymap.set("n", '<leader>""', 'ysiw"', {remap = true})
            vim.keymap.set("n", "<leader>''", "ysiw'", {remap = true})
        end
    }
}
