vim.api.nvim_create_user_command("Cpath", function()
    local path = vim.fn.expand("%:p")
    vim.fn.setreg("+", path)
    vim.notify('Copied "' .. path .. '" to the clipboard!')
end, {})

vim.api.nvim_create_user_command("Cfname", function()
    local fname = vim.fn.expand("%:t")
    vim.fn.setreg("+", fname)
    vim.notify('Copied "' .. fname .. '" to the clipboard!')
end, {})

vim.api.nvim_create_user_command("ReloadConfig", function()
    for name, _ in pairs(package.loaded) do
        if name:match('^yenidnya') and not name:match('nvim-tree') then
            package.loaded[name] = nil
        end
    end

    dofile(vim.env.MYVIMRC)
    vim.notify("Nvim configuration reloaded!", vim.log.levels.INFO)
end, {})
