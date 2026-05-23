local cmp = require('blink.cmp')

cmp.setup({
    fuzzy = {
        implementation = "prefer_rust_with_warning",
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
    appearance = {
        use_nvim_cmp_as_default = false,
        nerd_font_variant = "mono",
    },
    snippets = {
        preset = "luasnip"
    },
})

require("luasnip.loaders.from_vscode").lazy_load()
