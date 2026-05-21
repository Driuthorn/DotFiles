-- NOTE: pack hooks earlt autocmds

vim.api.nvim_create_autocmd("PackChanged", {
    callback = function(event)
        if event.data.spec and event.data.spec.name == "nvim-treesitter" then
            if not event.data.active then
                vim.cmd.packadd("nvim-treesitter")
            end

            vim.cmd("TSUpdate")
        end
    end,
})
