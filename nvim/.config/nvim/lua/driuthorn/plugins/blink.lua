local blink = require("blink.cmp")

blink.build():wait(60000)

blink.setup({
    fuzzy = {
        implementation = "lua",
    },
    keymap = {
        preset = "default",
    },

    completion = {
        menu = {
            auto_show = true,
        },
        documentation = {
            auto_show = true,
        },
        ghost_text = {
            enabled = false,
            show_with_menu = false,
        },
        accept = {
            auto_brackets = {
                enabled = true,
            },
        },
    },
    cmdline = {
        enabled = true,
        keymap = { preset = "cmdline" },
        completion = {
            menu = { auto_show = true },
        },
    },
    source = {
        default = { "lsp", "path", "buffer", "snippets" },
    },
    appearance = {
        use_nvim_cmp_as_default = false,
        nerd_font_variant = "mono",
    },
    snippets = {
        preset = "luasnip"
    },
})

require("luasnip.loaders.from_vscode").lazy_load()
