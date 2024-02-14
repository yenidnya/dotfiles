local t = require('telescope')
local actions = require('telescope.actions')

t.setup {
    defaults = {
        path_display = { 'smart' },
        mappings = {
            i = {
                ["<C-u>"] = actions.preview_scrolling_up,
                ["<C-d>"] = actions.preview_scrolling_down,
            }
        }
    },
    layout_config = {
        horizontal = {
            preview_cutoff = 100,
            preview_width = 0.6
        }
    },
    pickers = {
        buffers = {
            show_all_buffers = true,
            sort_mru = true,
            mappings = {
                i = {
                    ["<C-d>"] = "delete_buffer",
                },
            },
        },
    },
}

-- Extensions
require("dir-telescope").setup {}

-- Load Extensions
t.load_extension('dir')
t.load_extension('dap')
