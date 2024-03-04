return {
    'tpope/vim-fugitive',

    config = function()
       vim.keymap.set("n", "<leader>gs", vim.cmd.Git)
       vim.keymap.set('n', "<leader>gl", function ()
           vim.cmd.Git('log --pretty=format:"%h - %an, %ar : %s"')
       end)
    end
}
