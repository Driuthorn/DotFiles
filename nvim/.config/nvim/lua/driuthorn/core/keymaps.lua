
local opts = { noremap = true, silent = true }

vim.g.mapleader = " "

-- restart
vim.keymap.set("n", "<leader>re", "<cmd>restart<cr>", { desc = "Restart Neovim (:restart)" })

vim.keymap.set("n", "<leader><leader>", function() vim.cmd("so") end)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "moves lines down in visual selection" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "moves lines up in visual selection" })

vim.keymap.set("n", "<leader>pv", vim.cmd.Ex) -- Seek about using Vex/Hex or Rex https://www.reddit.com/r/vim/comments/12v898n/comment/jha6t1h/
vim.keymap.set("n", "<leader>q", ":q<cr>")
vim.keymap.set("n", "<S-q>", ":q!<cr>")
vim.keymap.set("n", "<leader>w", ":w!<cr>")


vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)


-- Code Folding
vim.keymap.set("n", "-", "<cmd>foldclose<CR>", { desc = "Close code fold"})
vim.keymap.set("n", "+", "<cmd>foldopen<CR>", { desc = "Open code fold"})
