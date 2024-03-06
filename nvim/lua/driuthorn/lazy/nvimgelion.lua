return {
    'nyngwang/nvimgelion',
    config = function() 
        vim.api.nvim_create_autcmd({ 'COlorScheme', 'FileType'},
        {
            callback = function()
                vim.cmd([[
                    hi Normal guibg=NONE ctermbg=NONE
                    hi EndOfBuffer guibg=NONE ctermbg=NONE
                ]])
            end
        })
    end
}
