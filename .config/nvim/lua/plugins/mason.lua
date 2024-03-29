require("mason").setup({
        event = { "BufReadPre", "BufNewFile" },
        build = ":MasonUpdate",
        -- keys = {
        --   { "<leader>lI", "<cmd>Mason<CR>", desc = "Opens Mason" },
        -- },
        cmd = { "Mason", "MasonInstall", "MasonUninstall", "MasonUninstallAll", "MasonUpdate", "MasonLog" },
        opts = {
            ui = {
                border = "rounded",
                height = 0.8,
                icons = {
                    package_installed = "✓",
                    package_pending = "➜",
                    package_uninstalled = "✗",
                },
            },
            log_level = vim.log.levels.INFO,
            max_concurrent_installers = 4,
        },
    })

require("mason-lspconfig").setup({
    event = { "BufReadPre", "BufNewFile" },
    opts = {
        automatic_installation = true,
    },
})
