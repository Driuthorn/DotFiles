vim.lsp.config("yamlls", {
    cmd = { "yaml-language-server", "--stdio" },
    filetypes = {
        "yaml",
    },
    settings = {
        redhat = {
            telemetry = {
                enabled = false,
            },
        },
        yaml = {
            format = {
                enable = true,
            },
        },
    },
})
