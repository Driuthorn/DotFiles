function ColorMyPencils(color)
    color = color or "rose-pine"
    vim.cmd.colorscheme(color)

    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

return {
    {
        "folke/tokyonight.nvim",
        config = function()
            local tn = require("tokyonight")
            tn.setup({
                style = "storm",
                transparent = true,
                terminal_colors = true,
                styles = {
                    comments = { italic = false },
                    keywords = { italic = false },
                    sidebars = "dark",
                    floats = "dark"
                },
            })
        end
    },
    {
        "rose-pine/neovim",
        name = "rose-pine",
        config = function()
            local rp = require('rose-pine')

            rp.setup({
                disable_background = true,
            })
        end
    },
    {
        'dracula/vim',
        name = "dracula",
    },
    {
        'nyngwang/nvimgelion',
        config = function()
            vim.api.nvim_create_autocmd({ 'ColorScheme', 'FileType' },
                {
                    callback = function()
                        vim.cmd([[
                hi Normal guibg=NONE ctermbg=NONE
                hi EndOfBuffer guibg=NONE ctermbg=NONE
              ]])
                    end
                })

            ColorMyPencils("nvimgelion")
        end
    }
}
