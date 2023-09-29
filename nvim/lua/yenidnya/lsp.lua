local map = vim.keymap

require('mason').setup()
require('mason-lspconfig').setup()

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

capabilities.textDocument.foldingRange = {
    dynamicRegistration = false,
    lineFoldingOnly = true
}

local lsp_attach = function(_, bufnr)
    map.set('n', '<leader>ch', vim.lsp.buf.hover, { buffer = bufnr, desc = 'Hover' })
    map.set('n', '<leader>ctd', vim.lsp.buf.type_definition, { buffer = bufnr, desc = 'Type def' })
    map.set('n', '<leader>cn', vim.lsp.buf.rename, { buffer = bufnr, desc = 'Rename' })
    map.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, { buffer = bufnr, desc = 'Code Action' })

    -- format
    map.set('n', '<leader>cf', function()
        vim.lsp.buf.format { async = true }
    end, { buffer = bufnr, desc = 'Format' })
end

local lsp_config = {
    capabilities = capabilities,
    on_attach = lsp_attach
}

require('mason-lspconfig').setup_handlers({
    function(server_name)
        require('lspconfig')[server_name].setup(lsp_config)
    end,
    lua_ls = function()
        require('lspconfig').lua_ls.setup(vim.tbl_extend('force', lsp_config, {
            settings = {
                Lua = {
                    diagnostics = {
                        globals = { 'vim' }
                    }
                }
            }
        }))
    end,
    -- Typescript is configured in p-ts_tools.lua
})

return lsp_config;
