local bufnr
local opts = {
    debug = false,
    log_path = vim.fn.stdpath("cache") .. "/lsp_signature.log", -- log dir when debug is on
    bind = true,
    doc_lines = 0, -- no docs
    max_height = 12,
    max_width = 80,
    floating_window = false, -- no window by default, trigger to display
    close_timeout = 2000, -- close floating window after ms when laster parameter is entered
    fix_pos = false,  -- set to true, the floating window will not auto-close until finish all parameters
    hint_enable = false, -- no virtual text
    hint_prefix = "",  -- no emoji
    hint_scheme = "String",
    hi_parameter = "LspSignatureActiveParameter", -- how your parameter will be highlight
    handler_opts = {
        border = "rounded"   -- double, rounded, single, shadow, none, or a table of borders
    },
    always_trigger = false,
    auto_close_after = nil,
    timer_interval = 200,
    toggle_key = "<C-s>",
}

require("lsp_signature").setup(opts, bufnr)
