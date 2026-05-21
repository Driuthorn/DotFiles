vim.lsp.config("omnisharp", {
    cmd = { "OmniSharp", "-z", "--hostPID", "12345",  "DotNet:enablePackageRestore=false", "--encoding", "utf-8", "--languageserver",  "dotnet" },
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
