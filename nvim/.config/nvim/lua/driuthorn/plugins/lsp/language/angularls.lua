vim.lsp.config("angularls", {
    cmd = { "ngserver", "--stdio", "./node_modules", "--tsProbeLocations", "--ngProbeLocations" },
    filetypes = {
        "typescript",
        "html",
        "typescriptreact",
        "htmlangular"
    },
})
