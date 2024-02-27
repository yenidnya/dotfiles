return {
	"nvim-telescope/telescope.nvim",
	lazy = false,
	tag = "0.1.5",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"tom-anders/telescope-vim-bookmarks.nvim",
		"princejoogie/dir-telescope.nvim",
		"nvim-telescope/telescope-dap.nvim",
	},
	config = function()
		local t = require("telescope")
		local actions = require("telescope.actions")

		t.setup({
			defaults = {
				path_display = { "smart" },
				mappings = {
					i = {
						["<C-u>"] = actions.preview_scrolling_up,
						["<C-d>"] = actions.preview_scrolling_down,
					},
				},
			},
			layout_config = {
				horizontal = {
					preview_cutoff = 100,
					preview_width = 0.6,
				},
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
		})

		-- Bookmarks
		t.load_extension("vim_bookmarks")

		-- Directories
		require("dir-telescope").setup({})
		t.load_extension("dir")

		-- Dap
		t.load_extension("dap")
	end,
}
