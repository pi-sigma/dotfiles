local lspconfig = require('lspconfig')
local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()

local on_attach = function(_, bufnr)
   -- See `:help vim.lsp.*` for documentation on any of the below functions
    local bufopts = { noremap = true, silent = true, buffer = bufnr }

    vim.keymap.set('n', '<leader>gD', vim.lsp.buf.declaration, bufopts)
    vim.keymap.set('n', '<leader>gd', vim.lsp.buf.definition, bufopts)
    vim.keymap.set('n', '<leader><space>', vim.lsp.buf.hover, bufopts)
    vim.keymap.set('n', '<leader>gi', vim.lsp.buf.implementation, bufopts)
    vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, bufopts)
    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, bufopts)
end

-- C
lspconfig.clangd.setup {
    capabilities = lsp_capabilities,
    on_attach = on_attach,
    flags = {
        debounce_text_changes = 150
    },
}

-- JavaScript/TypeScript
lspconfig.tsserver.setup {
    capabilities = lsp_capabilities,
    on_attach = on_attach,
    flags = {
        debounce_text_changes = 150
    },
    cmd = { 'typescript-language-server', '--stdio' },
}

-- Lua
lspconfig.lua_ls.setup {
    capabilities = lsp_capabilities,
    on_attach = on_attach,
    flags = {
        debounce_text_changes = 150
    },
    settings = {
        Lua = {
            diagnostics = {
                globals = { 'vim', 'opts' }
            }
        }
    },
}

-- Python
lspconfig.pylsp.setup {
    capabilities = lsp_capabilities,
    on_attach = on_attach,
    flags = {
        debounce_text_changes = 150
    },
    settings = {
        pylsp = {
            plugins = {
                flake8 = {
                    enabled = false,
                    ignore = { W292 },
                    maxLineLength = 88
                },
                pycodestyle = {
                   enabled = true,
                   maxLineLength = 88
                },
                pylint = { enabled = false, executable = "pylint" },
                pyflakes = { enabled = true },
                mypy = {enabled = false},
            },
        },
    }
}
