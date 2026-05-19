vim.lsp.config("rust_analyzer", {
    cmd = { "rust-analyzer" },
    filetypes = {
        "rust",
    },
    root_markers = {
        "Cargo.lock"
    },
    settings = {
        ["rust-analyzer"] = {
            check = {
                command = "clippy",
            },
            diagnostics = {
                enable = true,
            },
        },
    },
})
