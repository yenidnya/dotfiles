return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	cmd = { "ConformInfo" },
	keys = {
		{
			"<leader>cf",
			function()
				require("conform").format({ async = true, lsp_fallback = true })
			end,
			mode = "",
		},
	},
	-- Everything in opts will be passed to setup()
	opts = {
		formatters_by_ft = {
			lua = { "stylua" },
			-- Use a sub-list to run only the first available formatter
			json = { "prettierd" },
			javascript = { "prettierd" },
			javascriptreact = { "prettierd" },
			typescript = { "prettierd" },
			typescriptreact = { "prettierd" },
			html = { "prettierd" },
			yaml = { "prettierd" },
			css = { "prettierd" },
			toml = { "taplo" },
			markdown = { "mdformat" },
			sh = { "shfmt" },
		},
		-- Customize formatters
		formatters = {
			prettierd = {
				env = { PRETTIERD_DEFAULT_CONFIG = vim.fn.expand("~/.config/.prettierrc") },
			},
			taplo = {
				env = { TAPLO_CONFIG = vim.fn.expand("~/.config/.taplo.toml") },
			},
		},
	},
	init = function()
		-- If you want the formatexpr, here is the place to set it
		vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
	end,
}
