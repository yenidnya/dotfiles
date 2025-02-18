-- Bootstrap lazy
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("yenidnya.options")
require("yenidnya.functions")

require("lazy").setup({
	require("yenidnya.colorschema"),
	require("yenidnya.p-treesitter"),
	require("yenidnya.p-telescope"),
	require("yenidnya.p-nvim_tree"),
	require("yenidnya.p-lualine"),
	require("yenidnya.p-dap"),
	require("yenidnya.p-cmp"),
	require("yenidnya.p-text"),
	require("yenidnya.p-lsp"),
	require("yenidnya.p-formatter"),
	require("yenidnya.p-linter"),
	require("yenidnya.p-whichkey"),
	require("yenidnya.p-dashboard"),
	require("yenidnya.p-bookmarks"),
	require("yenidnya.p-zenmode"),
	require("yenidnya.p-git"),
	require("yenidnya.p-neorg"),
	require("yenidnya.p-vstask"),
	require("yenidnya.p-noice"),
})
