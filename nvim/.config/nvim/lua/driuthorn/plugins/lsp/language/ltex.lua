vim.lsp.config("ltex", {
    cmd = { "ltex-ls" },
    filetypes = {
        "bib",
        "gitcommit",
        "org",
        "plaintex",
        "rst",
        "rnoweb",
        "tex",
        "pandoc",
        "quarto",
        "rmd",
        "context",
        "html",
        "xhtml",
        "mail",
        "text"
    },
    settings = {
        ltex = {
            enabled = {
                "bibtex",
                "gitcommit",
                "org",
                "tex",
                "restructuredtext",
                "rsweave",
                "latex",
                "quarto",
                "rmd",
                "context",
                "html",
                "xhtml",
                "mail",
                "plaintext"
            },
            language = { "pt-BR", "en-US" },
        }
    },
})
