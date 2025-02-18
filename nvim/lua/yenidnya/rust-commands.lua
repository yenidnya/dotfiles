local M = {}

M.expand_macro = function()
	vim.lsp.buf_request_all(0, "rust-analyzer/expandMacro", vim.lsp.util.make_position_params(), function(result)
		-- Create a new tab
		vim.cmd("vsplit")

		-- Create an empty scratch buffer (non-listed, non-file i.e scratch)
		-- :help nvim_create_buf
		local buf = vim.api.nvim_create_buf(false, true)

		-- and set it to the current window
		-- :help nvim_win_set_buf
		vim.api.nvim_win_set_buf(0, buf)

		if result then
			-- set the filetype to rust so that rust's syntax highlighting works
			-- :help nvim_set_option_value
			vim.api.nvim_set_option_value("filetype", "rust", { buf = 0 })

			-- Insert the result into the new buffer
			for _client_id, res in pairs(result) do
				if res and res.result and res.result.expansion then
					-- :help nvim_buf_set_lines
					vim.api.nvim_buf_set_lines(buf, -1, -1, false, vim.split(res.result.expansion, "\n"))
				else
					vim.api.nvim_buf_set_lines(buf, -1, -1, false, {
						"No expansion available.",
					})
				end
			end
		else
			vim.api.nvim_buf_set_lines(buf, -1, -1, false, {
				"Error: No result returned.",
			})
		end
	end)
end

return M
