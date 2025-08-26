-- settings and ad-hoc overrides for different file types (syntax highlighting, tabs/spaces etc.)

-- helper functions
local set_shiftwidth_tabstop_stabstop = function (val)
    vim.opt.shiftwidth = val
    vim.opt.tabstop = val
    vim.opt.softtabstop = val
end


-- settings for various file types
vim.api.nvim_create_autocmd("FileType", {
    pattern = {
        "css", "go", "html", "gitconfig", "htmldjango", "javascript", "json", "lua", "scss", "vim",
    },
    callback = function()
        set_shiftwidth_tabstop_stabstop(4)
    end
})


-- settings for specific file types

-- c
vim.api.nvim_create_autocmd("FileType", {
    pattern = "c",
    callback = function()
        set_shiftwidth_tabstop_stabstop(4)

        vim.api.nvim_set_hl(0, "@function.call", { link = "GruvboxWhite" })
    end
})

-- dockerfile
vim.api.nvim_create_autocmd("FileType", {
    pattern = "dockerfile",
    callback = function()
        set_shiftwidth_tabstop_stabstop(4)

        vim.api.nvim_set_hl(0, "@function.call", { link = "GruvboxWhite" })
    end
})

-- markdown
vim.api.nvim_create_autocmd("FileType", {
    pattern = { "markdown" },
    callback = function()
        vim.opt_local.wrap = true
        vim.opt_local.textwidth = 80
    end
})

-- sh
vim.api.nvim_create_autocmd("FileType", {
    pattern = "sh",
    callback = function()
        set_shiftwidth_tabstop_stabstop(4)

        -- vim.api.nvim_set_hl(0, "@punctuation.special", { fg = "#fe8019" })
        -- vim.api.nvim_set_hl(0, "shDerefSimple", { fg = "#fe8019" })
        vim.api.nvim_set_hl(0, "shCommandSub", { link = "GruvboxWhite" })
        vim.api.nvim_set_hl(0, "shDerefLen", { link = "GruvboxWhite" })
        vim.api.nvim_set_hl(0, "shDerefOffset", { link = "GruvboxWhite" })
    end
})

-- yaml
vim.api.nvim_create_autocmd("FileType", {
    pattern = "yaml",
    callback = function()
        set_shiftwidth_tabstop_stabstop(2)
    end
})
