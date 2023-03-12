local lsp = require('lsp-zero')
local cmp = require('cmp')

lsp.preset('recommended')
lsp.setup()


-- Diagnostics
vim.diagnostic.config({
	severity_sort = true,
	float = {
		source = "always",
	},
})
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
	vim.lsp.diagnostic.on_publish_diagnostics, {
		signs = true,
		underline = false,
		show_diagnostic_autocmds = { 'InsertLeave', 'TextChanged' },
		virtual_text = true,
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
	vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
	vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
	-- vim.keymap.set('n', '<space>K', vim.lsp.buf.signature_help, bufopts)
	-- vim.keymap.set('n', 'gt', vim.lsp.buf.type_definition, bufopts)
	vim.keymap.set('n', '<F2>', vim.lsp.buf.rename, bufopts)
	vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
end

-- Global completion setup
cmp.setup {
	window = {
		-- don't show documentation window on complete
		documentation = {
			max_width = 0
		}
	},
	-- completion = {
	-- 	autocomplete = false
	-- }
}

-- C
require('lspconfig')['clangd'].setup {
	on_attach = on_attach,
	flags = {
		debounce_text_changes = 150
	},
}
-- Lua
require('lspconfig')['lua_ls'].setup {
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
	}
}
-- JavaScript/TypeScript
require('lspconfig')['tsserver'].setup {
	on_attach = on_attach,
	flags = {
		debounce_text_changes = 150
	},
	cmd = { 'typescript-language-server', '--stdio' },
}
-- Python
require('lspconfig')['pylsp'].setup {
	on_attach = on_attach,
	flags = {
		debounce_text_changes = 150
	},
	settings = {
		pylsp = {
			plugins = {
				flake8 = {
					enabled = false,
					ignore = {W292,},
					maxLineLength = 88
				},
				pycodestyle = {
					enabled = true,
					maxLineLength = 88
				},
				pyflakes = {enabled = true},
				pylint = {enabled = false},
			}
		}
	}
}


-- helper functions for swapping textobjects with treesitter
local swap_next, swap_prev = (function()
	local swap_objects = {
		p = "@parameter.inner",
		f = "@function.outer",
		c = "@class.outer",
	}
	local n, p = {}, {}

	for key, obj in pairs(swap_objects) do
		n[string.format("<A-n><A-%s>", key)] = obj
		p[string.format("<A-p><A-%s>", key)] = obj
	end

	return n, p
end)()

-- treesitter
require'nvim-treesitter.configs'.setup {
	ensure_installed = { "c", "lua", "vim", "help" },
	sync_install = false,
	auto_install = true,
	ignore_install = { },

	highlight = {
		enable = false,
		-- Use a function for more flexibility, e.g. to disable slow treesitter highlight for large files
		disable = function(lang, buf)
			local max_filesize = 100 * 1024 -- 100 KB
			local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
			if ok and stats and stats.size > max_filesize then
				return true
			end
		end,

		additional_vim_regex_highlighting = false,
	},

   textobjects = {
      select = {
         enable = true,
			-- Automatically jump forward to textobj, similar to targets.vim 
			lookahead = true,
			keymaps = {
				-- Use capture groups defined in textobjects.scm
				["af"] = "@function.outer",
				["if"] = "@function.inner",
				["ac"] = "@class.outer",
				["ic"] = "@class.inner",
         },
      },
		move = {
			enable = true,
			set_jumps = true,
			goto_next_start = {
				[']m'] = '@function.outer',
				[']]'] = '@class.outer'
			},
			goto_next_end = {
				[']M'] = '@function.outer',
				[']['] = '@class.outer'
			},
			goto_previous_start = {
				['[m'] = '@function.outer',
				['[['] = '@class.outer'
			},
			goto_previous_end = {
				['[M'] = '@function.outer',
				['[]'] = '@class.outer'
			}
		},
		swap = {
			enable = true,
			swap_next = swap_next,
			swap_previous = swap_prev,
		},
		lsp_interop = {
			enable = true,
			border = 'none',
			peek_definition_code = {
				["<leader>df"] = "@function.outer",
				["<leader>dc"] = "@class.outer"
			}
		},
   },
}
