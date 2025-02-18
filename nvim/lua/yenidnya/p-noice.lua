return {
	"folke/noice.nvim",
	event = "VeryLazy",
	opts = {
		cmdline = {
			enabled = false,
			view = "cmdline",
		},
		messages = {
			enabled = false,
		},
		popupmenu = {
			enabled = false,
		},
		notify = {
			enabled = false,
		},
		lsp = {
			progress = {
				enabled = true,
			},
		},
	},
	dependencies = {
		"MunifTanjim/nui.nvim",
	},
}
