return {
    "saghen/blink.cmp",
    dependencies = {
        "rafamadriz/friendly-snippets",
    },
    version = "1.*",
    config = function()
        vim.cmd('highlight Pmenu guibg=none')
        vim.cmd('highlight PmenuExtra guibg=none')
        vim.cmd('highlight FloatBorder guibg=none')
        vim.cmd('highlight NormalFloat guibg=none')

        require('blink.cmp').setup({
            snippets = { preset = "luasnip" },
            signature = { enabled = true },
            appearence = {
                use_nvim_cpm_as_default = false,
                nerd_font_variant = "normal",
            },
            sources = {
                per_filetype = {
                    codecompanion = { "codecompanion" },
                },
                default = { "lsp", "path", "snippets", "buffer" },
                providers = {
                    cmdline = {
                        min_keyword_length = 2,
                    },
                },
            },
            keymap = {
                preset = "default",
                -- ["<Tab>"] = {"snippet_forward", "fallback"},
                -- ["<S-Tab>"] = {"snippet_backward", "fallback"},

                ["<Tab>"] = {"select_next", "fallback"},
                ["<S-Tab>"] = {"select_prev", "fallback"},

                ["<C-n>"] = {"select_next", "fallback"},
                ["<C-p>"] = {"select_prev", "fallback"},
                ["<Up>"] = {"select_prev", "fallback"},
                ["<Down>"] = {"select_next", "fallback"},

                ["<S-k>"] = {"scroll_documentation_up", "fallback"},
                ["<S-j>"] = {"scroll_documentation_down", "fallback"},

                ["<C-space>"] = {"show", "show_documentation", "hide_documentation"},
                ["<C-e>"] = {"hide", "fallback"},
                ["<CR>"] = { "accept", "fallback" },
            },
            cmdline = {
                enabled = true,
                completion = { menu = { auto_show = true, ghost_text = { enabled = true } } },
                keymap = {
                    ["<CR>"] = { "accept", "fallback" },
                },
            },
            completion = {
                menu = {
                    border = nil,
                    scrolloff = 1,
                    scrollbar = false,
                    draw = {
                        columns = {
                            { "kind_icon" },
                            { "label",      "label_description", gap = 1 },
                            { "kind" },
                            { "source_name" },
                        },
                    },
                },
                documentation = {
                    window = {
                        border = nil,
                        scrollbar = false,
                        winhighlight = 'Normal:BlinkCmpDoc,FloatBorder:BlinkCmpDocBorder,EndOfBuffer:BlinkCmpDoc',
                    },
                    auto_show = true,
                    auto_show_delay_ms = 500,
                },
            },
        })

        require("luasnip.loaders.from_vscode").lazy_load()
    end
}
