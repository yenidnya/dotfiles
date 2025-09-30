-- mason-install.lua
local M = {}

-- Function to ensure formatters are installed
function M.ensure_formatters_installed()
	-- Simple list of formatters to install
	local formatters = {
		"stylua",
		"prettierd",
		"taplo",
		"mdformat",
		"shfmt",
		--"alejandra", --not available for macos
	}

	-- Check and install missing formatters
	local mason_registry = require("mason-registry")
	for _, formatter in ipairs(formatters) do
		if not mason_registry.is_installed(formatter) then
			print("Installing formatter: " .. formatter)
			local ok, pkg = pcall(mason_registry.get_package, formatter)
			if ok then
				pkg:install():once("closed", function()
					print("Finished installing: " .. formatter)
				end)
			else
				print("Error: Mason package not found for " .. formatter)
			end
		end
	end
end

return M
