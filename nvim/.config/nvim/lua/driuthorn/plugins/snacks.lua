local snacks = require("snacks")

snacks.setup({
    styles = {
        input = {
            keys = {
                n_esc = { "<C-c>", { "cmp_close", "cancel" }, mode = "n", expr = true },
                i_esc = { "<C-c>", { "cmp_close", "stopinsert" }, mode = "i", expr = true },
            },
        }
    },

    input = { enable = true },
    quickfile = {
        enable = true,
        exclude = { "latex" },
    },

    picker = {
        enabled = true,
        matchers = {
            frecency = true,
            cwd_bonus = false,
        },
        exclude = {
            ".git",
            "node-modules",
            "dist",
            "build",
        },
        formatters = {
            file = {
                filename_first = true,
                filename_only = false,
                icon_width = 2,
            },
        },
        layout = {
            preset = "telescope",
            cycle = false,
        },
        layouts = {
            select = {
                preview = false,
                layout = {
                    backdrop = false,
                    width = 0.6,
                    min_width = 80,
                    height = 0.4,
                    min_height = 10,
                    box = "vertical",
                    border = "rounded",
                    title = "{title}",
                    titles_pos = "center",
                    { win = "input", height = 1, border = "bottom" },
                    { win = "list", border = "none" },
                    { win = "preview", title = "{preview}", width = 0.5, height = 0.4, border = "top" },
                }
            },
            telescope = {
                reverse = true,
                layout = {
                    box = "horizontal",
                    backdrop = false,
                    width = 0.8,
                    height = 0.9,
                    border = "none",
                    {
                        box = "vertical",
                        { win = "list", title = " Results ", title_pos = "center", border = "rounded" },
                        { win = "input", height = 1, border = "rounded", title = "{title} {live} {flags}", title_pos = "center" },
                    },
                    {
                        win = "preview",
                        title = "{preview:Preview}",
                        width = 0.5,
                        border = "rounded",
                        title_pos = "center",
                    },
                },
            },
            ivy = {
                layout = {
                    box = "vertical",
                    backdrop = false,
                    width = 0,
                    height = 0.4,
                    position = "bottom",
                    border = "top",
                    title = " {title} {live} {flags}",
                    title_pos = "left",
                    { win = "input", height = 1, border = "bottom" },
                    {
                        box = "horizontal",
                        { win = "list", border = "none" },
                        { win = "preview", title = "{preview}", width = 0.5, border = "left" },
                    },
                },
            },
        }
    },

    image = {
        enable = function()
            return vim.bo.filetype == "markdown"
        end,
        doc = {
            float = false,
            inline = false,
            max_width = 50,
            max_height = 30,
            wo = { wrap = false },
        },
        convert = {
            notify = true,
            command = "magick"
        },
        img_dirs = { "img", "images", "assets", "media", "~/Downloads" },
    },

   -- dashboard = {
   --     enable = false,
   -- }
})

vim.keymap.set('n', '<leader>gi', function() snacks.picker.gh_issue() end, { desc = "GitHub Issues (open)" }) 
vim.keymap.set('n', '<leader>gI', function() snacks.picker.gh_issue({ state = "all" }) end, { desc = "GitHub Issues (all)" }) 
vim.keymap.set('n', '<leader>gp', function() snacks.picker.gh_pr() end, { desc = "GitHub Pull Requests (open)" }) 
vim.keymap.set('n', '<leader>gP', function() snacks.picker.gh_pr({ state = "all" }) end, { desc = "GitHub Pull Requests (all)" }) 

