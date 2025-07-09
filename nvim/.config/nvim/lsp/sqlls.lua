local blink = require("blink.cmp")
return {
    cmd = { "sql-language-server", "up", "--method", "stdio" },
    root_markers = { ".sqllsrc.json" },
    filetypes = { "sql", "mysql" },
    settings = {
    },
    capabilities = vim.tbl_deep_extend(
        "force",
        {},
        blink.get_lsp_capabilities(),
        {
            fileOperations = {
                didRename = true,
                willRename = true,
            },
        }
    ),
}
