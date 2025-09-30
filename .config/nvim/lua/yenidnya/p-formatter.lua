-- Set default value for the prettier toggle variable
vim.g.enable_prettier = true

local function maybe_format_with_prettier()
	if vim.g.enable_prettier then
		return { "prettierd" }
	else
		return {}
	end
end

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
			json = { "prettierd" },
			javascript = maybe_format_with_prettier,
			javascriptreact = maybe_format_with_prettier,
			typescript = maybe_format_with_prettier,
			typescriptreact = maybe_format_with_prettier,
			html = { "prettierd" },
			yaml = { "prettierd" },
			css = { "prettierd" },
			toml = { "taplo" },
			markdown = { "mdformat" },
			sh = { "shfmt" },
			nix = { "alejandra" },
		},
		-- Customize formatters
		formatters = {
			alejandra = {
				command = "alejandra",
			},
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
