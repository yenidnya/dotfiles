return {
	"folke/zen-mode.nvim",
	config = function()
		require("zen-mode").setup({
			window = {
				backdrop = 1,
				width = 150,
				height = 1,
			},
			plugins = {
				options = {
					enabled = true,
					ruler = false, -- disables the ruler text in the cmd line area
					showcmd = false, -- disables the command in the last line of the screen
				},
				gitsigns = { enabled = false }, -- enable gitsigns
				tmux = { enabled = false }, -- enable tmux line
				alacritty = {
					enabled = true,
					font = "18", -- font size
				},
			},
		})
	end,
}
