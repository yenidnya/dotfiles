-- Remap leader
vim.g.mapleader = ' '
local wk_opts = { prefix = "<leader>" }

local map = vim.keymap
local wk = require('which-key')

-- Line Navigation
map.set({ 'v', 'n' }, 'H', '^')
map.set({ 'v', 'n' }, 'L', '$')
map.set("v", "J", ":m '>+1<CR>gv=gv")
map.set("v", "K", ":m '<-2<CR>gv=gv")

-- Code Actions
wk.register({
    c = {
        name = 'Code',
        i = {
            name = 'Imports',
        },
        r = { '<cmd>Telescope lsp_references<cr>', 'References' },
        d = { '<cmd>Telescope lsp_definitions<cr>', 'Definitions' },
        m = { '<cmd>Telescope lsp_implementations<cr>', 'Implementatiosn' },
        h = "Hover",
        td = "Type Definitions",
        a = "Actions",
        f = "Format",
        n = "Rename",
    },
    e = { ":lua vim.diagnostic.open_float()<cr>", "Show Error" }
}, wk_opts)

-- Toggle keymaps
wk.register({
    t = {
        name = 'Toggle',
        t = { '<cmd>NvimTreeToggle<cr>', 'Tree' },
        d = { '<cmd>TodoTelescope<cr>', 'TodoTelescope' },
        g = { "<cmd>Git<cr>", "Git" },
        a = { '<cmd>ToggleAlternate<cr>', 'Alternate' },
        h = { "<cmd>nohlsearch<cr>", "Highlight" },
        z = { "<cmd>ZenMode<cr>", "ZenMode" },
        o = { "Change TODO State" }
    }
}, wk_opts)

-- Bookmarks
wk.register({
    b = {
        name = 'Bookmark',
        a = { "<cmd>lua require('telescope').extensions.vim_bookmarks.all()<cr>", 'All Bookmarks' },
        c = { "<cmd>lua require('telescope').extensions.vim_bookmarks.current_file()<cr>", 'Current Bookmarks' }
    }
}, wk_opts)

-- Telescope
local tscope_builtin = require('telescope.builtin')
wk.register({
    f = {
        name = "Telescope",
        f = { tscope_builtin.find_files, "Files" },
        g = { tscope_builtin.live_grep, "Word" },
        b = { tscope_builtin.buffers, "Buffers" },
        r = { tscope_builtin.resume, "Resume" },
        d = { "<cmd>Telescope dir live_grep<CR>", "Directory" },
        x = {
            name = "Debugger",
            c = { "<cmd>Telescope dap configurations<CR>", "Configurations" }
        }
    }
}, wk_opts)

local dapui = require('dapui')
function toggle_dapui_fn()
    local is_open = false
    return function()
        if is_open then
            dapui.close()
            is_open = false
        else
            dapui.open()
            is_open = true
        end
    end
end

local dap = require("dap")

wk.register({
    d = {
        name = "Debugger",
        f = { "<cmd>Telescope dap configurations<CR>", "Configurations" },
        c = { "<cmd>Telescope dap commands<CR>", "Commands" },
        v = { "<cmd>Telescope dap variables<CR>", "Variables" },
        u = { toggle_dapui_fn(), "Toggle UI" },
        b = { dap.toggle_breakpoint, "Toggle Breakpoint" }
    }
}, wk_opts)

-- MISC
wk.register({
    s = {
        name = 'Source',
        v = { ':ReloadConfig <CR>', '.vimrc' }
    }
}, wk_opts)

-- Org
wk.register({
    o = {
        name = "Org"
    }
}, wk_opts)

-- Git
wk.register({
    h = {
        name = "Git Hunk"
    }
}, wk_opts)

-- Harpoon
local mark = require('harpoon.mark')
local ui = require('harpoon.ui')
map.set('n', '<leader>a', mark.add_file, { desc = 'Harpoon Add' })
map.set('n', '<C-e>', ui.toggle_quick_menu)

-- Using ufo provider need remap `zR` and `zM`. If Neovim is 0.6.1, remap yourself
map.set('n', 'zR', require('ufo').openAllFolds)
map.set('n', 'zM', require('ufo').closeAllFolds)
