vim.lsp.config("sqlls", {
    cmd = { "sql-language-server", },
    filetypes = { "sql", "mysql" },
})
