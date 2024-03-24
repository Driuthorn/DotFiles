vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex) -- Seek about using Vex/Hex or Rex https://www.reddit.com/r/vim/comments/12v898n/comment/jha6t1h/
vim.keymap.set("n", "<leader>q", ":q<cr>")
vim.keymap.set("n", "<S-q>", ":q!<cr>")
vim.keymap.set("n", "<leader>w", ":w!<cr>")

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

-- Try config build/run

local f = require('driuthorn.functions')

vim.keymap.set("n", "<F5>", function()
    local ft = vim.bo.filetype
    local bd_command, bd_success = f.buildProject(ft)

    if bd_success then
        vim.cmd(bd_command)

        local rn_command, rn_success = f.RunProject(ft)

        if rn_success then
            vim.cmd(rn_command)
        else
            print("Error starting project!")
        end
    else
        print("Not Buildable Project!")
    end
end)

vim.keymap.set("n", "<F6>", function()
    local ft = vim.bo.filetype
    local bd_command, bd_success = f.buildProject(ft)

    if bd_success then
        vim.cmd(bd_command)
    else
        print("Not Buildable Project!")
    end
end)

vim.keymap.set("n", "<F7>", function()
    local ft = vim.bo.filetype
    local cl_command, cl_success = f.cleanProject(ft)

    if cl_success then
        vim.cmd(cl_command)
    else
        print("Not cleanable project")
    end
end)
