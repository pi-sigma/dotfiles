local lspconfig = require('lspconfig')
local lsp_defaults = lspconfig.util.default_config
local map = require("utils").map

lsp_defaults.capabilities = vim.tbl_deep_extend(
    'force', lsp_defaults.capabilities, require('cmp_nvim_lsp').default_capabilities()
)

local set_keymaps = function(client, bufnr)
    local bufopts = { buffer = bufnr }

    map('n', '<leader>gD', vim.lsp.buf.declaration, bufopts)
    map('n', '<leader>gd', vim.lsp.buf.definition, bufopts)
    map('n', '<leader><space>', vim.lsp.buf.hover, bufopts)
    map('n', '<leader>gi', vim.lsp.buf.implementation, bufopts)
    map('n', '<leader>rn', vim.lsp.buf.rename, bufopts)
end

local on_attach = function(client, bufnr)
    -- disable syntax highlighting (conflicts with treesitter)
    client.server_capabilities.semanticTokensProvider = nil

    set_keymaps(client, bufnr)
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

-- Css
lspconfig.cssls.setup {
    on_attach = on_attach,
    init_options = {
        camelCase = 'dashes',
    },
}

-- GO
lspconfig.gopls.setup{
  settings = {
    gopls = {
      analyses = {
        unusedparams = true,
      },
      staticcheck = true,
    },
  },
}

-- HTML
lspconfig.html.setup {
  on_attach = on_attach,
  filetypes = { 'html', 'htmldjango' }
}

-- Java
lspconfig.jdtls.setup({})

-- JavaScript/TypeScript
lspconfig.tsserver.setup {
    on_attach = set_keymaps,
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
                pycodestyle = {
                   enabled = true,
                   maxLineLength = 100,
                },
                pyflakes = { enabled = true },
            },
        },
    }
}

-- Yaml
lspconfig.yamlls.setup {
  on_attach = on_attach,
  settings = {
    yaml = {
      schemas = {}
    }
  }
}
