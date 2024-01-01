local harpoon_ui = require("harpoon.ui")
local harpoon_mark = require("harpoon.mark")

require("harpoon").setup({
    vim.keymap.set("n", "<leader>h", harpoon_ui.toggle_quick_menu, {}),
    vim.keymap.set("n", "<leader>H", harpoon_mark.add_file, {})
})
