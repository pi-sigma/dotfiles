local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable",
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = ","

require("lazy").setup("plugins", {
    change_detection = {
        notify = false,
    },
})

require("config.options")
require("config.mappings")

require("config.lsp.cmp")
require("config.lsp.diagnostic")
require("config.lsp.lspconfig")

require("functions")
