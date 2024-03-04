return {
    { "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        opts = {},
    },
    { "rose-pine/neovim", 
        name = "rose-pine",
        config = function() 
            vim.cmd("colorscheme rose-pine")
        end
    },
}
