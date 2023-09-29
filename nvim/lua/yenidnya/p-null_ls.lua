local null_ls = require("null-ls")

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local code_actions = null_ls.builtins.code_actions

null_ls.setup({
    sources = {
        formatting.prettierd,
        diagnostics.eslint_d,
        code_actions.eslint_d

    },
})
