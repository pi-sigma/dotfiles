local M = {}

function M.map(mode, lhs, rhs, opts)
    local options = {noremap = true, silent = true}

    if opts then
      options = vim.tbl_extend("force", options, opts)
    end

    -- The officially recommended command for mapping keys is: vim.api.nvim_set_keymap
    -- This does not seem to work with passing variables to the rhs parameter
    -- which are the result of a require("module") call; cf. settings in telescope.lua
    -- vim.keymap.set is more flexible
    vim.keymap.set(mode, lhs, rhs, options)
end

return M
