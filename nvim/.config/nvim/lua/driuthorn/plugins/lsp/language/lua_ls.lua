vim.lsp.config("lua_ls", {
    cmd = { "lua-language-server" },
    filetypes = { "lua" },
    settings = {
        Lua = {
            diagnostics = {
                -- disable = { "missing-fields" },
                globals = {
                    "vim",
                },
            },
            completion = {
                callSnippet = "Replace",
            },
            hint = {
                enable = true,
                setType = false,
                paramType = true,
                paramName = "Disable",
                semicolon = "Disable",
                arrayIndex = "Disable",
            },
        },
    },
})
