-- always center cursur (see mappings for more restricted centering)
vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
  desc = "Center cursor",
  group = vim.api.nvim_create_augroup("CenterCursor", { clear = true }),
  callback = function()
    local mode = vim.fn.mode(1)
    if mode == "i" then return end
    vim.cmd "normal! zz"
  end,
})
