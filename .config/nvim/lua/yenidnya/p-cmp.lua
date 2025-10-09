return {
	"saghen/blink.cmp",
	-- optional: provides snippets for the snippet source
	dependencies = {
		"rafamadriz/friendly-snippets",
		"nvim-mini/mini.icons",
		"onsails/lspkind.nvim",
	},

	-- use a release tag to download pre-built binaries
	version = "1.*",

	---@module 'blink.cmp'
	---@type blink.cmp.Config
	opts = {
		-- 'default' (recommended) for mappings similar to built-in completions (C-y to accept)
		-- 'super-tab' for mappings similar to vscode (tab to accept)
		-- 'enter' for enter to accept
		-- 'none' for no mappings
		--
		-- All presets have the following mappings:
		-- C-space: Open menu or open docs if already open
		-- C-n/C-p or Up/Down: Select next/previous item
		-- C-e: Hide menu
		-- C-k: Toggle signature help (if signature.enabled = true)
		keymap = { preset = "enter" },

		appearance = {
			nerd_font_variant = "mono",
		},

		completion = {
			documentation = { auto_show = false },
			menu = {
				draw = {
					components = {
						kind_icon = {
							text = function(ctx)
								if vim.tbl_contains({ "Path" }, ctx.source_name) then
									local mini_icon, _ = require("mini.icons").get(ctx.item.data.type, ctx.label)
									if mini_icon then
										return mini_icon .. ctx.icon_gap
									end
								end

								local icon = require("lspkind").symbolic(ctx.kind, { mode = "symbol" })
								return icon .. ctx.icon_gap
							end,

							-- Optionally, use the highlight groups from mini.icons
							-- You can also add the same function for `kind.highlight` if you want to
							-- keep the highlight groups in sync with the icons.
							highlight = function(ctx)
								if vim.tbl_contains({ "Path" }, ctx.source_name) then
									local mini_icon, mini_hl =
										require("mini.icons").get(ctx.item.data.type, ctx.label)
									if mini_icon then
										return mini_hl
									end
								end
								return ctx.kind_hl
							end,
						},
						kind = {
							-- Optional, use highlights from mini.icons
							highlight = function(ctx)
								if vim.tbl_contains({ "Path" }, ctx.source_name) then
									local mini_icon, mini_hl =
										require("mini.icons").get(ctx.item.data.type, ctx.label)
									if mini_icon then
										return mini_hl
									end
								end
								return ctx.kind_hl
							end,
						},
					},
				},
			},
		},

		cmdline = {
			keymap = { preset = "inherit" },
			completion = {
				menu = {
					auto_show = function()
						local cmdline = vim.fn.getcmdline()
						local first_char = cmdline:sub(1, 1)
						return vim.fn.getcmdtype() == ":" and (vim.fn.strchars(cmdline) >= 3 or first_char:match("%u"))
					end,
				},
			},
		},

		-- Default list of enabled providers defined so that you can extend it
		-- elsewhere in your config, without redefining it, due to `opts_extend`
		sources = {
			default = { "lsp", "path", "snippets", "buffer" },
		},

		fuzzy = { implementation = "prefer_rust_with_warning" },
	},
	opts_extend = { "sources.default" },
}
