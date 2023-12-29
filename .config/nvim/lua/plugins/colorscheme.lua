-- overriding highlighting for Dockerfiles via plugin does not work
vim.api.nvim_create_autocmd("FileType", {
    pattern = "dockerfile",
    callback = function(args)
        vim.api.nvim_set_hl(0, "@function.call", { fg = "#ffd7af" })
    end
})

-- remove/change
vim.api.nvim_create_autocmd("FileType", {
    pattern = "c",
    callback = function(args)
        vim.api.nvim_set_hl(0, "@function.call", { fg = "#ffd7af" })
    end
})

return {
    {
        "pi-sigma/gruvbox.nvim",
        branch = "develop",
        priority = 10000,
        lazy = false,
        bold = false,

        config = function (opts)
            require("gruvbox").setup(opts)
            vim.cmd("colorscheme gruvbox")
        end,
    }
}
