vim.diagnostic.config({
    severity_sort = true,
    float = {
        source = "always",
    },
})

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics, {
        underline = false,
        virtual_text = false,
        update_in_insert = false,
    }
)

-- Diagnostic signs
local signs = {Error = ">>", Warn = "--", Hint = "--", Info = "--"}
for type, _ in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    -- show line number instead of sign (`numhl`)
    vim.fn.sign_define(hl, { texthl = hl, text = "", numhl = hl })
end

-- Keymaps
local opts = { noremap = true, silent = true }
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<leader>dl', vim.diagnostic.setloclist, opts)
