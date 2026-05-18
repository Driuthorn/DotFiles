
-- Early pack Hooks
require("driuthorn.plugins.pack-hooks")

-- Plugins
vim.pack.add({
    -- Core
    { src = "https://github.com/christoomey/vim-tmux-navigator" },
    -- { src = "" },
    
    -- Git
    { src = "https://github.com/tpope/vim-fugitive" },
    { src = "https://github.com/nvim-treesitter/nvim-treesitter", version = "main" },
    { src = "https://github.com/nvim-treesitter/nvim-treesitter-textobjects" },
    { src = "https://github.com/folke/snacks.nvim"},


    -- General
    { src = "https://github.com/folke/which-key.nvim" },
    { src = "https://github.com/nvim-telescope/telescope.nvim", version = "master" },
    { src = "https://github.com/saghen/blink.cmp", version = "1.*" },
    { src = "https://github.com/L3MON4D3/LuaSnip", version = "v2.4.1" },
    -- { src = "https://github.com/"},
    -- { src = "https://github.com/"},

    -- Colorschema
    { src = "https://github.com/folke/tokyonight.nvim" },
    { src = "https://github.com/rose-pine/nvim", name = "rose-pine" },
    { src = "https://github.com/dracula/vim", name = "dracula"},
    { src = "https://github.com/scottmckendry/cyberdream.nvim", name = "cyberdream" },
    { src = "https://github.com/nyngwang/nvimgelion", name = "nvimgelion" },

    -- Pratice
    { src = "https://github.com/nvzone/typr" },

    -- Lsp
    { src = "https://github.com/mason-org/mason.nvim"},


    -- Dependencies
    { src = "https://github.com/nvim-lua/plenary.nvim" },
    { src = "https://github.com/rafamadriz/friendly-snippets" },
    { src = "https://github.com/nvzone/volt" },
    { src = "https://github.com/saghen/blink.lib" },

})


-- Mock
-- { src = "https://github.com/"}

-- Call Plugins
-- Core

-- Git
require("driuthorn.plugins.treesitter")
require("driuthorn.plugins.vim-fugitive")
require("driuthorn.plugins.snacks")

-- General
require("driuthorn.plugins.which-key")
require("driuthorn.plugins.telescope")

-- Pratice
require("driuthorn.plugins.typr")

-- Colorschema
require("driuthorn.plugins.colorschema")

-- Completion
require("driuthorn.plugins.blink")

-- Lsp
require("driuthorn.plugins.lsp.mason")
require("driuthorn.plugins.lsp.lspconfig")
require("driuthorn.plugins.lsp.core.autocmds")
require("driuthorn.plugins.lsp.core.language")
