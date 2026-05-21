local treesitter = require("nvim-treesitter")

local ensure_installed = {
    "bash",
    "angular",
    "javascript",
    "typescript",
    "c",
    "c_sharp",
    "dockerfile",
    "lua",
    "vim",
    "vimdoc",
    "query",
    "json",
    "yaml",
    "angular",
    "html",
    "python",
    "sql",
    "terraform",
    "tmux",
    "toml",
    "tsx",
    "rust",
    "markdown",
    "markdown_inline",
}

treesitter.install(ensure_installed)


