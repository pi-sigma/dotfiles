return {
    -- autocomplete
    "hrsh7th/nvim-cmp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-nvim-lua",
    {
       "L3MON4D3/LuaSnip",
       opts = {
          options = {
             tag = 'v2.*',
          },
       }
    },
    "saadparwaiz1/cmp_luasnip",

    -- lsp
    "neovim/nvim-lspconfig",
}
