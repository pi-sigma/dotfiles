return {
    {
        "alvan/vim-closetag",
        config = function ()
            vim.g.closetag_filename = {"*.html", "*.xhtml,*", "phtml"}
            vim.g.closetag_filetypes = {"html", "xhtml", "phtml"}
            vim.g.closetag_xhtml_filenames = {"*.xhtml", "*.jsx"}
            vim.g.closetag_xhtml_filetypes = {"xhtml", "jsx"}
            vim.g.closetag_shortcut = ">"
            -- " Add > at current position without closing the current tag, default is ''
            vim.g.closetag_shortcut = "<leader>>"
        end
    }
}
