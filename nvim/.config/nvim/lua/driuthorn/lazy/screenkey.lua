return {
    "NStefan002/screenkey.nvim",
    version = "*",
    config = function()
        local sk = require("screenkey")
        local notify = require("notify")

        local function toggleScreenKey()
            vim.cmd("Screenkey")


            notify.setup({
                top_down = sk.is_active(),
            })
        end

        vim.keymap.set("n", "<leader>tsk", toggleScreenKey, { desc = "[T]oggle [S]creen[K]ey" })
    end
}
