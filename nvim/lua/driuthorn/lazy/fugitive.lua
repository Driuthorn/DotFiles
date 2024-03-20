return {
    'tpope/vim-fugitive',
    name = "fugitive",
    config = function()
       vim.keymap.set("n", "<leader>gs", vim.cmd.Git)
       vim.keymap.set('n', "<leader>gl", function ()
           vim.cmd.Git('log --pretty=format:"%h - %an, %ar : %s"')
       end)

       local Driuthorn_Fugitive = vim.api.nvim_create_augroup("Driuthorn_Fugitive", {})

       local autocmd = vim.api.nvim_create_autocmd

       autocmd("BufWinEnter", {
           group = Driuthorn_Fugitive,
           pattern = "*",
           callback = function()
                if vim.bo.ft ~= "fugitive" then
                    return
                end

                local bufnr = vim.api.nvim_get_current_buf()
                local opts = { buffer = bufnr, remap = false }
                
                vim.keymap.set("n", "<leader>p", function()
                    vim.cmd.Git('push')
                end, opts)

                vim.keymap.set("n", "<leader>f", function()
                    vim.cmd.Git('fetch')
                end, opts)

                vim.keymap.set("n", "<leader>s", function()
                    vim.cmd.Git('status')
                end, opts)

                vim.keymap.set("n", "<leader>P", function()
                    vim.cmd.Git({'pull --rebase'})
                end,opts)
           end,
       })

    end
}
