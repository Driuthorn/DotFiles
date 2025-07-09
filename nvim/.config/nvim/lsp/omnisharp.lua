local blink = require("blink.cmp")
return {
    cmd = { "omnisharp", "-z", "--hostPID", "12345", "DotNet:enablePackageRestore=false", "--encoding", "utf-8", "languageserver" },
    filetypes = { "cs", "vb" },
    root_markers = {
        '.sln',
        '.csproj',
        'omnisharp.json',
        'function.json',
    },
    settings = {
        FormattingOptions = {
            EnableEditorConfigSupport = true,
        },
        MSBuild = {},
        RenameOptions = {},
        RoslynExtensionsOptions = {},
        Sdk = {
            IncludePrereleases = true
        }
    },
    capabilities = vim.tbl_deep_extend(
        "force",
        {},
        vim.lsp.protocol.make_client_capabilities(),
        blink.get_lsp_capabilities(),
        {
            fileOperations = {
                didRename = true,
                willRename = true,
            },
        }
    ),
}

