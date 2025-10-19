local api = vim.api
local f = vim.fn

api.nvim_create_user_command("Cpath", function()
	local path = f.expand("%:p")
	f.setreg("+", path)
	vim.notify('Copied "' .. path .. '" to the clipboard!')
end, {})

api.nvim_create_user_command("Cfname", function()
	local fname = f.expand("%:t")
	f.setreg("+", fname)
	vim.notify('Copied "' .. fname .. '" to the clipboard!')
end, {})

api.nvim_create_user_command("ReloadConfig", function()
	for name, _ in pairs(package.loaded) do
		if name:match("^yenidnya") and not name:match("nvim-tree") then
			package.loaded[name] = nil
		end
	end

	dofile(vim.env.MYVIMRC)
	vim.notify("Nvim configuration reloaded!", vim.log.levels.INFO)
end, {})

api.nvim_create_user_command("CenterTree", function()
	local len = f.strlen(f.getline("."))
	vim.cmd({ cmd = "NvimTreeResize", args = { len + 3 } })
end, {})

api.nvim_create_user_command("ActiveLinters", function()
	local linters = require("lint").get_running()
	if #linters == 0 then
		vim.notify("No active linters")
	else
		vim.notify("󱉶 " .. table.concat(linters, ", "), vim.log.levels.INFO)
	end
end, {})

api.nvim_create_user_command("TogglePrettier", function()
	vim.g.enable_prettier = not vim.g.enable_prettier
	local status = vim.g.enable_prettier and "enabled" or "disabled"
	vim.notify("Prettier formatting " .. status)
end, {})
