require("plenary")

require("neo-tree").setup({
    vim.keymap.set("n", "<leader>nn", ":Neotree<CR>", {}),
    vim.keymap.set("n", "<leader>nf", ":Neotree reveal<CR>", {}),

    enable_git_status = true,
    filesystem = {
        filtered_items = {
            visible = true, -- when true, files will be displayed differently than normal items
            hide_dotfiles = true,
            hide_gitignored = true,
            hide_by_name = {
                ".DS_Store",
                "thumbs.db"
                --"node_modules"
            },
            never_show = {
                ".DS_Store",
                ".mypy_cache", "__pycache__", ".pytest_cache", ".pytype",
                ".idea",
            },
        },
    },
    window = {
        position = "float",
        width = 40,
        mapping_options = {
            noremap = true,
            nowait = true,
        },
        mappings = {
            ["<space>"] = {
                "toggle_node",
                nowait = false,
            },
            ["<2-LeftMouse>"] = "open",
            ["<cr>"] = "open",
            ["<esc>"] = "cancel",
            ["<leader>n"] = { "toggle_preview", config = { use_float = true, use_image_nvim = true } },
            ["l"] = "focus_preview",
            ["S"] = "open_split",
            ["s"] = "open_vsplit",
            ["t"] = "open_tabnew",
            ["C"] = "close_node",
            ["z"] = "close_all_nodes",
            ["a"] = {
                "add",
                config = {
                    show_path = "none" -- "none", "relative", "absolute"
                }
            },
            ["A"] = "add_directory",
            ["d"] = "delete",
            ["r"] = "rename",
            ["y"] = "copy_to_clipboard",
            ["x"] = "cut_to_clipboard",
            ["p"] = "paste_from_clipboard",
            ["c"] = "copy",
            ["m"] = "move",
            ["q"] = "close_window",
            ["R"] = "refresh",
            ["?"] = "show_help",
            ["<"] = "prev_source",
            [">"] = "next_source",
            ["i"] = "show_file_details",
            -- yank path or filename
            -- https://github.com/nvim-neo-tree/neo-tree.nvim/discussions/370
            ['Y'] = function(state)
                -- NeoTree is based on [NuiTree](https://github.com/MunifTanjim/nui.nvim/tree/main/lua/nui/tree)
                -- The node is based on [NuiNode](https://github.com/MunifTanjim/nui.nvim/tree/main/lua/nui/tree#nuitreenode)
                local node = state.tree:get_node()
                local filepath = node:get_id()
                local filename = node.name
                local modify = vim.fn.fnamemodify

                local results = {
                  filepath,
                  modify(filepath, ':.'),
                  modify(filepath, ':~'),
                  filename,
                  modify(filename, ':r'),
                  modify(filename, ':e'),
                }

                -- absolute path to clipboard
                local i = vim.fn.inputlist({
                  'Choose to copy to clipboard:',
                  '1. Absolute path: ' .. results[1],
                  '2. Path relative to CWD: ' .. results[2],
                  '3. Path relative to HOME: ' .. results[3],
                  '4. Filename: ' .. results[4],
                  '5. Filename without extension: ' .. results[5],
                  '6. Extension of the filename: ' .. results[6],
                })

                if i > 0 then
                  local result = results[i]
                  if not result then return print('Invalid choice: ' .. i) end
                  vim.fn.setreg('"', result)
                  vim.notify('Copied: ' .. result)
                end
              end
        }
    }
})
