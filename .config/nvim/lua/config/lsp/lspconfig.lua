local lspconfig = require('lspconfig')
local lsp_defaults = lspconfig.util.default_config

lsp_defaults.capabilities = vim.tbl_deep_extend(
    'force', lsp_defaults.capabilities, require('cmp_nvim_lsp').default_capabilities()
)

local on_attach = function(client, bufnr)
    local bufopts = { noremap = true, silent = true, buffer = bufnr }

    -- disable syntax highlighting (conflicts with treesitter)
    client.server_capabilities.semanticTokensProvider = nil

    vim.keymap.set('n', '<leader>gD', vim.lsp.buf.declaration, bufopts)
    vim.keymap.set('n', '<leader>gd', vim.lsp.buf.definition, bufopts)
    vim.keymap.set('n', '<leader><space>', vim.lsp.buf.hover, bufopts)
    vim.keymap.set('n', '<leader>gi', vim.lsp.buf.implementation, bufopts)
    vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, bufopts)
    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, bufopts)
end

-- Bash
lspconfig.bashls.setup {
    on_attach = on_attach,
    flags = {
        debounce_text_changes = 150
    },
}

-- C
lspconfig.clangd.setup {
    on_attach = on_attach,
    flags = {
        debounce_text_changes = 150
    },
}

-- HTML
lspconfig.html.setup {
  on_attach = on_attach,
  filetypes = { 'html', 'htmldjango' }
}

-- JavaScript/TypeScript
lspconfig.tsserver.setup {
    on_attach = on_attach,
    flags = {
        debounce_text_changes = 150
    },
    cmd = { 'typescript-language-server', '--stdio' },
}

-- Lua
lspconfig.lua_ls.setup {
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
                   enabled = false,
                   maxLineLength = 88
                },
                pylint = { enabled = false, executable = "pylint" },
                pyflakes = { enabled = true },
                mypy = {enabled = true},
            },
        },
    }
}

lspconfig.yamlls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    yaml = {
      schemas = {}
    }
  }
}
