vim.lsp.config( "omnisharp", {
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
})
