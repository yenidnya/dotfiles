return {
	"echasnovski/mini.starter",
	config = function()
		local starter = require("mini.starter")

		starter.setup({
			content_hooks = {
				starter.gen_hook.adding_bullet(""),
				starter.gen_hook.aligning("center", "center"),
			},
			evaluate_single = true,
			footer = os.date(),
			query_updaters = [[abcdefghilmoqrstuvwxyz0123456789_-,.ABCDEFGHIJKLMOQRSTUVWXYZ]],
			items = {
				starter.sections.recent_files(5, true),
				starter.sections.recent_files(5, false),
				starter.sections.telescope(),
				{ action = "enew", name = "E: New Buffer", section = "Builtin actions" },
				{ action = "qall!", name = "Q: Quit Neovim", section = "Builtin actions" },
			},
		})

		vim.cmd([[
          augroup MiniStarterJK
            au!
            au User MiniStarterOpened nmap <buffer> j <Cmd>lua MiniStarter.update_current_item('next')<CR>
            au User MiniStarterOpened nmap <buffer> k <Cmd>lua MiniStarter.update_current_item('prev')<CR>
          augroup END
        ]])
	end,
}
