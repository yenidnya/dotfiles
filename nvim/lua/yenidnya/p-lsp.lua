return {
	{ "neovim/nvim-lspconfig" },
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			local map = vim.keymap
			local capabilities = vim.lsp.protocol.make_client_capabilities()
			capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

			capabilities.textDocument.foldingRange = {
				lineFoldingOnly = true,
			}

			local lsp_attach = function(_, bufnr)
				map.set("n", "<leader>ch", vim.lsp.buf.hover, { buffer = bufnr, desc = "Hover" })
				map.set("n", "<leader>ctd", vim.lsp.buf.type_definition, { buffer = bufnr, desc = "Type def" })
				map.set("n", "<leader>cn", vim.lsp.buf.rename, { buffer = bufnr, desc = "Rename" })
				map.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { buffer = bufnr, desc = "Code Action" })
			end

			local lsp_config = {
				capabilities = capabilities,
				on_attach = lsp_attach,
			}

			local rust_commands = require("rust-commands")

			require("mason-lspconfig").setup_handlers({
				function(server_name)
					require("lspconfig")[server_name].setup(lsp_config)
				end,
				lua_ls = function()
					require("lspconfig").lua_ls.setup(vim.tbl_extend("force", lsp_config, {
						settings = {
							Lua = {
								diagnostics = {
									globals = { "vim" },
								},
							},
						},
					}))
				end,
				rust_analyzer = function()
					require("lspconfig").rust_analyzer.setup(vim.tbl_extend("error", lsp_config, {
						settings = {
							["rust-analyzer"] = {
								["server.extraEnv"] = {
									-- Use custom target dir for rust-analyzer to prevent collisions with brazil-build
									CARGO_TARGET_DIR = ".rust-analyzer/target",
								},
								checkOnSave = {
									allTargets = true,
								},
							},
						},
						commands = {
							ExpandMacro = { rust_commands.expand_macro },
						},
					}))
				end,
				-- Typescript is configured in p-ts_tools.lua
				typos_lsp = function()
					require("lspconfig").typos_lsp.setup({
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
			})
		end,
	},
}
