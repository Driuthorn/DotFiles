vim.lsp.config( "bashls", {
    filetypes = { 
        "bash", 
        "sh", 
    },
    settings = {
        bashIde = {
            globPattern = "*@(.sh|.inc|.bash|.command)"
        }
    },
})
