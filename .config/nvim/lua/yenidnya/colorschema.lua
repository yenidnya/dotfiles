return {
	"navarasu/onedark.nvim",
	lazy = false,
	config = function()
		local onedark = require("onedark")
		onedark.setup({
			colors = {
				bg0 = "#181818",
				bg1 = "#323232",
				bg2 = "#49505f",
				bg3 = "#333842",
				bg_d = "#181818",
			},
		})
		onedark.load()
	end,
}
