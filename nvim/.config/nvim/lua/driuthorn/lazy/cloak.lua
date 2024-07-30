return {
    "laytan/cloak.nvim",
    name = "cloak",
    config = function()
        local cloak = require("cloak")

        cloak.setup({
            enable = false,
            cloak_character = "*",
            highlight_group = "Comment",
            patterns = {
                {
                    file_pattern = {
                        ".env*",
                        "appsettings.*",
                        "*.yaml",
                        "*.yml"
                    },
                    cloak_pattern = {"=.+", ":.+", "-.+"}
                },
            },
        })

        vim.keymap.set("n", "<leader>ct", ":CloakToggle<cr>")
    end
}
