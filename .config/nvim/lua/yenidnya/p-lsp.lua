return {
	{ "neovim/nvim-lspconfig" },
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
			require("mason-install").ensure_formatters_installed()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"rust_analyzer",
					"jsonls",
					"lua_ls",
					"ts_ls",
					"typos_lsp",
					"zls",
				},
			})

			vim.lsp.config("lua_ls", {
				settings = {
					Lua = {
						diagnostics = {
							globals = { "vim" },
						},
					},
				},
			})

			vim.lsp.config("eslint", {
				cmd = {
					"vscode-eslint-language-server",
					"--stdio",
					"--rulesdir",
					"/Volumes/workspace/prime-video/src/AVLivingRoomClient/build-tools/eslint/rules",
				},
			})

			vim.lsp.config("typos_lsp", {
				init_options = {
					-- Custom config. Used together with a config file found in the workspace or its parents,
					-- taking precedence for settings declared in both.
					-- Equivalent to the typos `--config` cli argument.
					config = "~/.config/typos.toml",
					-- How typos are rendered in the editor, can be one of an Error, Warning, Info or Hint.
					diagnosticSeverity = "Hint",
				},
			})
		end,
	},
}
