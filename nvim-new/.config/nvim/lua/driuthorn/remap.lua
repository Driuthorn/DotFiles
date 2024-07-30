vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex) -- Seek about using Vex/Hex or Rex https://www.reddit.com/r/vim/comments/12v898n/comment/jha6t1h/
vim.keymap.set("n", "<leader>q", ":q<cr>")
vim.keymap.set("n", "<S-q>", ":q!<cr>")
vim.keymap.set("n", "<leader>w", ":w!<cr>")

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

vim.keymap.set("n", "<leader><leader>", function ()
    vim.cmd("so")
end)
