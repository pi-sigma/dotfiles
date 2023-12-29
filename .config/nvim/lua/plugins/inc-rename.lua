return {
    {
        "smjonas/inc-rename.nvim",
        event = "VeryLazy",
        config = function ()
            vim.keymap.set("n", "<leader>rn", ":IncRename ")
        end
    },
}
