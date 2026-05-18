
local signs - {
    [vim.diagnostic.severity.ERROR] = " ",
    [vim.diagnostic.severity.WARN] = " ",
    [vim.diagnostic.severity.INFO] = " ",
    [vim.diagnostic.severity.HINT] = "",
}

vim.diagnostic.config({
    signs = { text = signs },
    virtual_text = true,
    underline = true,
    update_in_insert = false,
    severity_sort = true,
    float = {
        focusable = false,
        style = "minimal",
        border = "rounded",
        source = "always",
        header = "",
        prefix = "",
    },
})

vim.keymap.set("n","<leader>lx", function()
    local current = vim.diagnostic.config().virtual_text
    vim.diagnostic.config({ virtual_text = not current })
end, { desc = "Toggle LSP virtual text" })

local capabilities = vim.lsp.protocol.make_client_capabilities()

local ok, blink = pcall(require, "blink.cmp")
if ok then
    capabilities = blink.get_lsp_capabilities(capabilities)
end

vim.lsp.config('*', {
    capabilities = capabilities
})

vim.lsp.enable({
    "angularls",
    "bashls",
    "html",
    "jsonls",
    "ltex",
    "lua_ls",
    "omnisharp",
    "rust_analyzer",
    "sqlls",
    "ts_ls",
    "yamlls",
    "remark_ls",
})
