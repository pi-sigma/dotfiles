local lsp = require('lsp-zero')
local cmp = require('cmp')

lsp.preset('recommended')
lsp.setup()

-- Diagnostics
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
	vim.lsp.diagnostic.on_publish_diagnostics, {
		signs = true,
		underline = false,
		virtual_text = false,
		update_in_insert = false,
	}
)
-- Diagnostic signs
local signs = { Error = ">>", Warn = "--", Hint = "--", Info = "--" }
for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl= hl, numhl = hl })
end


local on_attach = function(client, bufnr)
	-- Enable completion triggered by <c-x><c-o>
	vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

	local bufopts = { noremap=true, silent=true, buffer=bufnr }
	vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
	vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
	vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
	vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
	vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
	vim.keymap.set('n', '<space>K', vim.lsp.buf.signature_help, bufopts)
	-- vim.keymap.set('n', 'gt', vim.lsp.buf.type_definition, bufopts)
	vim.keymap.set('n', '<F2>', vim.lsp.buf.rename, bufopts)
	-- vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
	-- vim.keymap.set('n', '<space>f', vim.lsp.buf.formatting, bufopts)
	vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
	vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
	vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
end


require('lspconfig')['sumneko_lua'].setup {
	on_attach = on_attach,
	flags = {
		debounce_text_changes = 150
	},
	cmp.setup {
		completion = {
			autocomplete = false
		}
	},
	settings = {
		Lua = {
			diagnostics = {
				globals = { 'vim', 'opts' }
			}
		}
	}
}

require('lspconfig')['pylsp'].setup {
	on_attach = on_attach,
	flags = {
		debounce_text_changes = 150
	},
	cmp.setup {
		completion = {
			autocomplete = false
		}
	},
	settings = {
		pylsp = {
			plugins = {
				flake8 = {
					enabled = false,
					ignore = {},
					maxLineLength = 86
				},
				pycodestyle = {enabled = false},
				pyflakes = {enabled = false},
				pylint = {enabled = true},
			}
		}
	}
}
