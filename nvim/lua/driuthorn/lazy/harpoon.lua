return {
    'ThePrimeagen/harpoon',
    branch = "harpoon2",
    requires = { "plenary" },

    config = function()
        local harpoon = require("harpoon")

        harpoon:setup()

        vim.keymap.set("n", "<leader>a", function() harpoon:list():append() end)
        vim.keymap.set("n", "<leader>r", function() harpoon:list():remove() end)

        vim.keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

        vim.keymap.set("n", "<leader>n", function() harpoon:list():next() end)
        vim.keymap.set("n", "<leader>p", function() harpoon:list():prev() end)
    end
}
