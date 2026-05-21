local sk = require("screenkey")
local ntf = require("notify")

local function toggleScreenKey()
    vim.cmd("Screenkey")

    ntf.setup({
        top_down = sk.is_active(),
    })
end

vim.keymap.set("n", "<leader>tsk", toggleScreenKey, { desc = "[T]oggle [S]creen[K]ey" })
