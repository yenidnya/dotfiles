local map = vim.keymap

-- Line Navigation
map.set({ "v", "n" }, "H", "^")
map.set({ "v", "n" }, "L", "$")
map.set("v", "J", ":m '>+1<CR>gv=gv")
map.set("v", "K", ":m '<-2<CR>gv=gv")

return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	version = "2.1.0", -- pin to 2.1
	config = function()
		local wk_opts = { prefix = "<leader>" }
		local wk = require("which-key")
		wk.setup({
			layout = {
				align = "center",
			},
		})

		local tscope_builtin = require("telescope.builtin")
		local tscope = require("telescope")
		local amzn_brazil = require("amzn-brazil")

		-- Code Actions
		wk.register({
			c = {
				name = "Code",
				i = {
					name = "Imports",
				},
				r = { tscope_builtin.lsp_references, "References" },
				d = { tscope_builtin.lsp_definitions, "Definitions" },
				m = { tscope_builtin.lsp_implementations, "Implementatiosn" },
				h = { vim.lsp.buf.hover, "Hover" },
				td = { vim.lsp.buf.type_definition, "Type Definitions" },
				a = { vim.lsp.buf.code_action, "Actions", mode = { "n", "v" } },
				f = "Format", -- formatting is defined in p-formatter
				n = { vim.lsp.buf.rename, "Rename" },
				c = { amzn_brazil.get_remote_code_url, "Copy remote URL" },
			},
			e = { ":lua vim.diagnostic.open_float()<cr>", "Show Error" },
		}, wk_opts)

		-- Toggle keymaps
		wk.register({
			t = {
				name = "Toggle",
				t = { "<cmd>NvimTreeToggle<cr>", "Tree" },
				d = { "<cmd>TodoTelescope<cr>", "TodoTelescope" },
				g = { "<cmd>Git<cr>", "Git" },
				a = { "<cmd>ToggleAlternate<cr>", "Alternate" },
				h = { "<cmd>nohlsearch<cr>", "Highlight" },
				z = { "<cmd>ZenMode<cr>", "ZenMode" },
			},
		}, wk_opts)

		-- Bookmarks
		wk.register({
			b = {
				name = "Bookmark",
				a = { tscope.extensions.vim_bookmarks.all, "All Bookmarks" },
				c = { tscope.extensions.vim_bookmarks.current_file, "Current Bookmarks" },
			},
		}, wk_opts)

		-- Telescope
		wk.register({
			f = {
				name = "Telescope",
				f = { tscope_builtin.find_files, "Files" },
				g = { tscope_builtin.live_grep, "Word" },
				b = { tscope_builtin.buffers, "Buffers" },
				r = { tscope_builtin.resume, "Resume" },
				d = { "<cmd>Telescope dir live_grep<CR>", "Directory" },
			},
		}, wk_opts)

		local dapui = require("dapui")
		function Toggle_dapui_fn()
			local is_open = false
			return function()
				if is_open then
					dapui.close()
					is_open = false
				else
					dapui.open()
					is_open = true
				end
			end
		end

		local dap = require("dap")

		wk.register({
			d = {
				name = "Debugger",
				f = { "<cmd>Telescope dap configurations<CR>", "Configurations" },
				c = { "<cmd>Telescope dap commands<CR>", "Commands" },
				v = { "<cmd>Telescope dap variables<CR>", "Variables" },
				u = { Toggle_dapui_fn(), "Toggle UI" },
				b = { dap.toggle_breakpoint, "Toggle Breakpoint" },
				s = {
					name = "Step",
					i = { dap.step_into, "Step into" },
					c = { dap.continue, "Continue" },
					o = { dap.step_over, "Step Over" },
				},
				t = { dap.terminate, "Terminate" },
			},
		}, wk_opts)

		-- MISC
		wk.register({
			s = {
				name = "Source",
				v = { ":ReloadConfig <CR>", ".vimrc" },
			},
		}, wk_opts)

		-- Org
		wk.register({
			o = {
				name = "Org",
			},
		}, wk_opts)

		-- Git
		wk.register({
			h = {
				name = "Git Hunk",
			},
		}, wk_opts)
	end,
}
