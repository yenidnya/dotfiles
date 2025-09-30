local function organize_imports(err, result, _)
	if err then
		vim.notify("Error organizing imports: " .. err.message, vim.log.levels.ERROR)
		return nil, err
	end

	if not result then
		vim.notify("No changes needed for organizing imports", vim.log.levels.INFO)
		return
	end

	-- Apply the workspace edit if we got a result
	if result.edit then
		vim.lsp.util.apply_workspace_edit(result.edit, "utf-8")
		vim.notify("Imports organized", vim.log.levels.INFO)
	end

	return result
end

vim.api.nvim_create_user_command("OrganizeImports", function()
	local bufnr = vim.api.nvim_get_current_buf()
	local client = vim.lsp.get_clients({ name = "ts_ls", bufnr = bufnr })[1]

	client:exec_cmd({
		title = "organize_imports",
		command = "_typescript.organizeImports",
		arguments = {
			vim.api.nvim_buf_get_name(bufnr),
		},
	}, { bufnr = bufnr }, organize_imports)
end, {})
