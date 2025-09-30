return {
	{ "gcmt/wildfire.vim" },
	{ "rmagatti/alternate-toggler" },
	{ "mg979/vim-visual-multi" },
	{ "tpope/vim-surround" },
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = true,
	},
	{
		"numToStr/Comment.nvim",
		lazy = false,
		config = function()
			require("Comment").setup()
		end,
	},
	{
		"folke/todo-comments.nvim",
		config = function()
			require("todo-comments").setup({})
		end,
		dependencies = { "nvim-lua/plenary.nvim" },
	},
	{
		"axelvc/template-string.nvim",
		config = function()
			require("template-string").setup({
				filetypes = { "typescript", "javascript", "typescriptreact", "javascriptreact", "python" }, -- filetypes where the plugin is active
				jsx_brackets = true, -- must add brackets to jsx attributes
				remove_template_string = false, -- remove backticks when there are no template string
				restore_quotes = {
					-- quotes used when "remove_template_string" option is enabled
					normal = [[']],
					jsx = [["]],
				},
			})
		end,
	},
	{
		"kevinhwang91/nvim-ufo",
		dependencies = "kevinhwang91/promise-async",
		config = function()
			require("ufo").setup()
			vim.keymap.set("n", "zR", require("ufo").openAllFolds)
			vim.keymap.set("n", "zM", require("ufo").closeAllFolds)
		end,
	},
}
