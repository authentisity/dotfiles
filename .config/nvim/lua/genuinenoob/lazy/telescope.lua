return {
    'nvim-telescope/telescope.nvim',
    version = '*',
    dependencies = {
        'nvim-lua/plenary.nvim',
        -- optional but recommended
        { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    },
    keys = {
        { "<leader>ff", "<cmd>Telescope find_files<CR>", desc = "Find Files" },
        { "<leader>fg", "<cmd>Telescope live_grep<CR>", desc = "Live Grep" },
        { "<leader>fb", "<cmd>Telescope buffers<CR>", desc = "Find Buffers" },
        { "<leader>fh", "<cmd>Telescope help_tags<CR>", desc = "Help Tags" },
    },

    config = function()
        local telescope = require('telescope')
        local actions = require('telescope.actions')

        local ignore_patterns_list = {".git", "node_modules", "venv", "__pycache__", "%.xlsx", "%.jpg", "%.png", "%.webp",
    "%.pdf", "%.odt", "%.ico"}

        require('telescope').setup{
            defaults = {
                file_ignore_patterns = ignore_patterns_list,
                layout_strategy = "horizontal",
                layout_config = {
                    prompt_position = "top",
                    preview_width = 0.55,
                },
                sorting_strategy = "ascending",

                mappings = {
                    i = {
                        ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
                    },
                },
            },

            pickers = {
                find_files = {
                    hidden = true,
                },
                live_grep = {
                    find_command = { "rg", "--files", "--hidden", "--glob", "!**/.git/*" },
                    layout_config = {
                        preview_width = 0,
                    }
                },
            },

        }

        telescope.load_extension('fzf')
    
    end
}
