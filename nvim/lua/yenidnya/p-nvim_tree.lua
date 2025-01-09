-- disable netrw at the very start
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

return {
	"nvim-tree/nvim-tree.lua",
	lazy = false,
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require("nvim-tree").setup({
			hijack_directories = {
				enable = true,
				auto_open = false,
			},
			sort_by = "case_sensitive",
			update_focused_file = {
				enable = true,
				update_cwd = true,
			},
			filters = {
				custom = { "^.git$", "^node_modules$" },
			},
			git = {
				enable = false,
			},
			log = {
				enable = true,
				types = {
					diagnostics = true,
				},
			},
			diagnostics = {
				enable = true,
				show_on_dirs = false,
				debounce_delay = 50,
				icons = {
					hint = "",
					info = "",
					warning = "",
					error = "",
				},
			},
		})
	end,
}
