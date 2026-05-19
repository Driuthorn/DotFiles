local ms = require("mason")
local ms_lsp = require("mason-lspconfig")

ms.setup({})

ms_lsp.setup({
    automatic_enable = false,
    ensure_installed = {
        "angularls",
        "bashls",
        "csharp_ls",
        "jsonls",
        "ltex",
        "lua_ls",
        "remark_ls",
        "rust_analyzer",
        "sqlls",
        "ts_ls",
        "yamlls",
    },
})
