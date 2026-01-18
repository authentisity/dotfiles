return { 
    'nvim-tree/nvim-tree.lua',
    version = '*',
    config = function()
        local function apply_highlights()
            vim.api.nvim_set_hl(0, "NvimTreeGitDirty",   { link = "GitSignsChange" })
            vim.api.nvim_set_hl(0, "NvimTreeGitStaged",  { link = "GitSignsAdd" })
            vim.api.nvim_set_hl(0, "NvimTreeGitNew",     { link = "GitSignsAdd" })
            vim.api.nvim_set_hl(0, "NvimTreeGitDeleted", { link = "GitSignsDelete" })
            vim.api.nvim_set_hl(0, "NvimTreeGitRenamed", { link = "GitSignsChange" })
            vim.api.nvim_set_hl(0, "NvimTreeGitMerge",   { link = "GitSignsDelete" })
            vim.api.nvim_set_hl(0, "NvimTreeGitIgnored", { link = "Comment" })
        end

        apply_highlights()

        vim.api.nvim_create_autocmd("ColorScheme", {
            pattern = "*",
            callback = apply_highlights,
        })    
 
        require("nvim-tree").setup({
            hijack_cursor = true,
            focus_empty_on_setup = true,
            sync_root_with_cwd = true,

            sort = {
                sorter = "case_sensitive",
            },
            view = {
                width = 30,
                signcolumn = "no",
            },

            renderer = {
                full_name = true,
                group_empty = true,
                special_files = {},
                symlink_destination = false,
                indent_markers = {
                    enable = true,
                },
                highlight_git = true,
                icons = {
                    git_placement = "after",
                    bookmarks_placement = "after",
                    show = {
                        file = false,
                        folder = false,
                        folder_arrow = true,
                        git = true,
                    },
                    glyphs = {
                        git = {
                            ignored = ""
                        },
                    },
                },
            },

            update_focused_file = {
                enable = true,
                update_root = true,
                ignore_list = { "help" },
            },
            diagnostics = {
                enable = true,
                show_on_dirs = true,
                show_on_open_dirs = true,
                debounce_delay = 50,
            },
            filters = {
                git_ignored = false,
            },
            actions = {
                open_file = {
                    resize_window = true,
                    window_picker = {
                        chars = "aoeui",
                    },
                },
                remove_file = {
                    close_window = false,
                },
            },
       })

        vim.keymap.set('n', '<leader>e', ':NvimTreeToggle<CR>', { noremap = true, silent = true })
   end,
}

