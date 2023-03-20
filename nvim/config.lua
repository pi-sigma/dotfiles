local lsp = require('lsp-zero')
lsp.preset('recommended')
lsp.setup()
local cmp = require('cmp')


--- Aerial ---
require('aerial').setup({
	-- optionally use on_attach to set keymaps when aerial has attached to a buffer
	on_attach = function(bufnr)
		-- Jump forwards/backwards with '{' and '}'
		vim.keymap.set('n', '{', '<cmd>AerialPrev<CR>', { buffer = bufnr })
		vim.keymap.set('n', '}', '<cmd>AerialNext<CR>', { buffer = bufnr })
	end,

	layout = {
		-- max_width = {40, 0.2} means "the lesser of 40 columns or 20% of total"
		max_width = { 40, 0.2 },
		width = nil,
		min_width = 30,
		default_direction = "prefer_left",
		placement = "window",
		preserve_equality = false,
	},

	-- A list of all symbols to display. Set to false to display all symbols.
	-- This can be a filetype map (see :help aerial-filetype-map)
	-- To see all available values, see :help SymbolKind
	filter_kind = {
		"Class",
		"Constructor",
		"Enum",
		"Function",
		"Interface",
		"Module",
		"Method",
		"Property",
		"Struct",
		"Variable",
	},
})
vim.keymap.set('n', '<leader>ae', '<cmd>AerialToggle<CR>')


---------
-- LSP --
---------
-- Diagnostics
vim.diagnostic.config({
   severity_sort = true,
   float = {
      source = "always",
   },
})

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
   vim.lsp.diagnostic.on_publish_diagnostics, {
      -- signs = true,
      underline = false,
      virtual_text = false,
      update_in_insert = false,
   }
)
-- Diagnostic signs
local signs = { Error = ">>", Warn = "--", Hint = "--", Info = "--" }
for type, icon in pairs(signs) do
   local hl = "DiagnosticSign" .. type
   vim.fn.sign_define(hl, { text = "", texthl = hl, numhl = hl })
end

vim.fn.sign_define(hl, { text = "", texthl = hl, numhl = hl })
-- General config
-- See: https://github.com/neovim/nvim-lspconfig/tree/54eb2a070a4f389b1be0f98070f81d23e2b1a715#suggested-configuration
local opts = { noremap = true, silent = true }
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<leader>dl', vim.diagnostic.setloclist, opts)

local on_attach = function(client, bufnr)
   -- Enable completion triggered by <c-x><c-o>
   vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

   -- Mappings.
   -- See `:help vim.lsp.*` for documentation on any of the below functions
   local bufopts = { noremap = true, silent = true, buffer = bufnr }
   -- vim.keymap.set('n', '<leader>gD', vim.lsp.buf.declaration, bufopts)
   -- vim.keymap.set('n', '<leader>gd', vim.lsp.buf.definition, bufopts)
   vim.keymap.set('n', '<leader><space>', vim.lsp.buf.hover, bufopts)
   -- vim.keymap.set('n', '<leader>gi', vim.lsp.buf.implementation, bufopts)
   -- vim.keymap.set('n', '<C-K>', vim.lsp.buf.signature_help, bufopts)
   -- vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, bufopts)
   -- vim.keymap.set('n', '<leader>gr', vim.lsp.buf.references, bufopts)
   -- vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, bufopts)
   vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, bufopts)
end


------------------
-- Autocomplete --
------------------
-- Global setup
cmp.setup {
   window = {
      -- don't show documentation window on complete
      documentation = {
         max_width = 0
      }
   },
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
               ignore = { W292 },
               maxLineLength = 88
            },
            pycodestyle = {
               enabled = true,
               maxLineLength = 88
            },
            pylint = { enabled = false, executable = "pylint" },
            pyflakes = { enabled = true },
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


--------------
-- Rename --
--------------
require("inc_rename").setup(
   vim.keymap.set("n", "<leader>rn", ":IncRename ")
)


----------------
-- Treesitter --
----------------
require 'nvim-treesitter.configs'.setup {
   ensure_installed = { "c", "lua", "python", "vim", "vimdoc" },
   sync_install = false,
   auto_install = false,
   ignore_install = {},

   highlight = {
      enable = true,
      additional_vim_regex_highlighting = true,
   },

   -- Syntax highlighting is defined in /.config/nvim/after/syntax/XYZ.vim
   -- The highlighting for Python decorators does not work correctly unless
   -- variable and field are defined here (due to the order in which config
   -- files are loaded)
   -- vim.api.nvim_set_hl(0, "@variable.python", { ctermfg = white }),
   -- vim.api.nvim_set_hl(0, "@field.python", { ctermfg = white }),

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
         -- jump forward
         goto_next_start = {
            ["]f"] = "@function.outer",
            ["]m"] = { query = "@class.outer", desc = "Next class start" },
            ["]s"] = { query = "@scope", query_group = "locals", desc = "Next scope" },
            ["]z"] = { query = "@fold", query_group = "folds", desc = "Next fold" },
         },
         goto_next_end = {
            ["]F"] = "@function.outer",
            ["]M"] = "@class.outer",
         },
         goto_previous_start = {
            ["[f"] = "@function.outer",
            ["[m"] = "@class.outer",
         },
         goto_previous_end = {
            ["[F"] = "@function.outer",
            ["[M"] = "@class.outer",
         },
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


---------------
-- autopairs --
---------------
require("nvim-autopairs").setup {}

--------
-- zk --
--------
require("zk").setup({
   -- can be "telescope", "fzf" or "select" (`vim.ui.select`)
   -- it's recommended to use "telescope" or "fzf"
   picker = "fzf",

   lsp = {
      -- `config` is passed to `vim.lsp.start_client(config)`
      config = {
         cmd = { "zk", "lsp" },
         name = "zk",
         -- on_attach = ...
         -- etc, see `:h vim.lsp.start_client()`
      },

      -- automatically attach buffers in a zk notebook that match the given filetypes
      auto_attach = {
         enabled = true,
         filetypes = { "markdown" },
      },
   },
})

-- Add the key mappings only for Markdown files in a zk notebook.
if require("zk.util").notebook_root(vim.fn.expand('%:p')) ~= nil then
   local function map(...) vim.api.nvim_buf_set_keymap(0, ...) end

   local opts = { noremap = true, silent = false }

   -- Create a new note after asking for its title.
   map("n", "<leader>zn", "<Cmd>ZkNew { dir = vim.fn.expand('%:p:h'), title = vim.fn.input('Title: ') }<CR>", opts)
   -- Create a new note in the same directory as the current buffer, using the current selection for title.
   map("v", "<leader>znt", ":'<,'>ZkNewFromTitleSelection { dir = vim.fn.expand('%:p:h') }<CR>", opts)

   -- Open notes linking to the current buffer.
   map("n", "<leader>zb", "<Cmd>ZkBacklinks<CR>", opts)
   -- Alternative for backlinks using pure LSP and showing the source context.
   --map('n', '<leader>zb', '<Cmd>lua vim.lsp.buf.references()<CR>', opts)
   -- Open notes linked by the current buffer.
   map("n", "<leader>zL", "<Cmd>ZkLinks<CR>", opts)

   -- Preview a linked note.
   map("n", "K", "<Cmd>lua vim.lsp.buf.hover()<CR>", opts)
end

---------------
-- Telescope --
---------------
require('telescope').setup {
   defaults = {
      file_ignore_patterns = {
         "node_modules",
      },
      mappings = {
         i = {
            ["<C-h>"] = "which_key",
            ["<C-q>"] = require('telescope.actions').close,
         }
      },
   },
   pickers = {},
   extensions = {}
}


--------------
-- Terminal --
--------------
-- mappings to move out from terminal to other views
vim.keymap.set('t', '<C-h>', '<C-\\><C-n><C-w>h')

-- Close terminal window, even if we are in insert mode
vim.keymap.set('t', '<leader>q', '<C-\\><C-n>:q<cr>')
