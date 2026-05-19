local Driuthorn_Fugitive = vim.api.nvim_create_augroup("Driuthorn_Fugitive", {})

vim.keymap.set("n", "<leader>gs", vim.cmd.Git)
vim.keymap.set("n", "<leader>gl", function() vim.cmd.Git('log --pretty=format: "%h - %an, %ar : %s"') end)

vim.api.nvim_create_autocmd("BufWinEnter", {
    group = Driuthorn_Fugitive,
    pattern = "*",
    callback = function ()

        if vim.bo.ft ~= "fugitive" then
            return
        end

        local buf = vim.api.nvim_get_current_buf()
        local opts = { buffer = buf, remap = false }

        opts.desc = "Git Push"
        vim.keymap.set("n", "<leader>p", function() vim.cmd.Git('push') end, opts)

        opts.desc = "Git Fetch"
        vim.keymap.set("n", "<leader>f", function() vim.cmd.Git('fetch') end, opts)

        opts.desc = "Git Status"
        vim.keymap.set("n", "<leader>s", function() vim.cmd.Git('status') end, opts)

        opts.desc = "Git Pull Rebase"
        vim.keymap.set("n", "<leader>P", function() vim.cmd.Git('pull --rebase') end, opts)
    end,
})
