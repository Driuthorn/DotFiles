return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "neovim/nvim-lspconfig",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-cmdline",
        "hrsh7th/nvim-cmp",
        "hrsh7th/cmp-nvim-lsp-signature-help",
        "L3MON4D3/LuaSnip",
        "saadparwaiz1/cmp_luasnip",
        "j-hui/fidget.nvim",
    },
    config = function()
        local cmp = require("cmp")
        local cmp_lsp = require("cmp_nvim_lsp")
        local capabilities = vim.tbl_deep_extend(
            "force",
            {},
            vim.lsp.protocol.make_client_capabilities(),
            cmp_lsp.default_capabilities()
        )

        require("fidget").setup({})
        require("mason").setup()
        require("mason-lspconfig").setup({
            ensure_installed = {
                "angularls",
                "bashls",
                "eslint",
                "html",
                "jsonls",
                "ltex",
                "omnisharp",
                "remark_ls",
                "lua_ls",
                "rust_analyzer",
                "ts_ls",
                "yamlls"
            },
            handlers = {
                function(server_name)
                    require("lspconfig")[server_name].setup { capabilities = capabilities }
                end,

                ["lua_ls"] = function()
                    local lspconfig = require("lspconfig")
                    lspconfig.lua_ls.setup {
                        capabilities = capabilities,
                        settings = {
                            Lua = {
                                diagnostics = {
                                    globals = { "vim", "it", "describe", "before_each", "after_each" },
                                }
                            }
                        }
                    }
                end,

                ["remark_ls"] = function()
                    local lspconfig = require("lspconfig")
                    lspconfig.remark_ls.setup {
                        settings = {
                            remark = {
                                requireConfig = true
                            }
                        }
                    }
                end,

                ["ltex"] = function()
                    local lspconfig = require("lspconfig")
                    lspconfig.ltex.setup {
                        on_attach = function()
                            vim.env.JAVA_HOME = vim.fs.find(
                                function(name) return vim.startswith(name, "jdk-") end,
                                { path = vim.fn.stdpath("data") .. "mason/packages/ltex/", type = "directory" }
                            )[1]
                        end,
                        settings = {
                            ltex = {
                                language = "pt-BR,en-US"
                            }
                        }
                    }
                end,
            }
        })

        local cmp_select = { behavier = cmp.SelectBehavior.Select }

        cmp.setup({
            snippet = {
                expand = function(args)
                    require('luasnip').lsp_expand(args.body)
                end,
            },
            mapping = cmp.mapping.preset.insert({
                ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
                ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
                ['<S-Tab>'] = cmp.mapping.select_prev_item(cmp_select),
                ['<Tab>'] = cmp.mapping.select_next_item(cmp_select),
                ['<C-Space>'] = cmp.mapping.complete(),
                ['<CR>'] = cmp.mapping.confirm({
                    behavior = cmp.ConfirmBehavior.Insert,
                    select = true
                }),
            }),
            sources = cmp.config.sources({
                { name = 'path' },
                { name = 'nvim_lsp',               keyword_length = 3 },
                { name = 'luasnip',                keyword_length = 2 },
                { name = 'nvim_lsp_signature_help' },
                { name = 'nvim_lua',               keyword_length = 2 },
            }, {
                { name = 'buffer', keyword_length = 2 },
                { name = 'calc' },
            }),
            window = {
                completion = cmp.config.window.bordered(),
                documentation = cmp.config.window.bordered(),
            },
            formatting = {
                fields = { 'menu', 'abbr', 'kind' },
                format = function(entry, item)
                    local menu_icon = {
                        nvim_lsp = 'λ',
                        buffer = 'Ω',
                        path = '🖫',
                    }

                    item.menu = menu_icon[entry.source.name]
                    return item
                end
            }
        })

        local sign = function(opts)
            vim.fn.sign_define(opts.name, {
                texthl = opts.name,
                text = opts.text,
                numhl = ''
            })
        end

        sign({ name = 'DiagnosticSignError', text = ' ' })
        sign({ name = 'DiagnosticSignWarn', text = ' ' })
        sign({ name = 'DiagnosticSignHint', text = '' })
        sign({ name = 'DiagnosticSignInfo', text = ' ' })

        vim.diagnostic.config({
            virtual_text = false,
            signs = true,
            update_in_insert = true,
            underline = true,
            serverity_sort = false,
            float = {
                focusable = false,
                style = "minimal",
                border = "rounded",
                source = "always",
                header = "",
                prefix = "",
            },
        })

        local Driuthorn_Lsp = vim.api.nvim_create_augroup("Driuthorn_Lsp", {})
        local autocmd = vim.api.nvim_create_autocmd

        autocmd('LspAttach', {
            group = Driuthorn_Lsp,
            callback = function(e)
                local opts = { buffer = e.buf }

                vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
                vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
                vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
                vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
                vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
                vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
                vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
                vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
                vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
                vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
            end
        })
    end
}
