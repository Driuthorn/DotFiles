vim.lsp.config("ts_ls", {
    workspace_required = false,
    filetypes = {
        "javascript",
        "javascriptreact",
        "javascript.jsx",
        "typescript",
        "typescriptreact",
        "typescript.tsx",
    },
    single_file_support = true,
    init_options = {
        preferences = {
            includeCompletionsForModuleExports = true,
            includeCompletionsForImportStatements = true,
        },
    },
    settings = {
        typescript = {
            inlayHints = {
                includeInlayParameterNameHits = "all",
                includeInlayVariableTypeHints = true,
                includeInlayFunctionParameterTypeHints = true,
            },
        },
        javascript = {
            inlayHints = {
                includeInlayParameterNameHits = "none",
                includeInlayVariableTypeHints = false,
                includeInlayFunctionParameterTypeHints = false,
            },
        },
    },
})
