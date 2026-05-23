local augroup = vim.api.nvim_create_augroup
local DriuthornGroup = augroup('Driuthorn', {})

local autocmd = vim.api.nvim_create_autocmd
local yank_group = augroup('HighlightYank', {})

autocmd("LspAttach", {
    group = augroup("DriuthornLspConfig", {}),
    callback = function(e)
        local opts = { buffer = e.buf }

        opts.desc = "Show LSP references"
        vim.keymap.set("n", "gR", "<cmd>Telescope lsp_references<cr>", opts)

        opts.desc = "Go to declaration"
        vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)

        opts.desc = "Show LSP definition"
        vim.keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<cr>", opts)

        opts.desc = "Show LSP implementations"
        vim.keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts)

        opts.desc = "Show LSP type definitions"
        vim.keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts)

        opts.desc = "See available code actions"
        vim.keymap.set({ "n", "v" }, "<leader>vca", function() vim.lsp.buf.code_action() end, opts)

        opts.desc = "Smart rename"
        vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)

        opts.desc = "Show buffer diagnostics"
        vim.keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufn=0<CR>", opts)

        opts.desc = "Show line diagnotics"
        vim.keymap.set("n", "<leader>d", "vim.diagnostics.open_float", opts)

        opts.desc = "Show documentation for what is under cursor"
        vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)

        opts.desc = "Restart LSP"
        vim.keymap.set("n", "<leader>rs", ":lsp restart<CR>", opts)

        opts.desc = "Signature Help"
        vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
    end,
})

autocmd('TextYankPost', {
    group = yank_group,
    pattern = '',
    callback = function()
        vim.highlight.on_yank({
            higroup = 'IncSearch',
            timeout = 40,
        })
    end,
})

autocmd('BufWritePre', {
    group = DriuthornGroup,
    pattern = "*",
    command = [[%s/\s\+$//e]],
})

autocmd('FileType', {
    pattern = "*",
    callback = function(args)
        local buf = args.buf
        local ft = vim.bo[buf].filetype
        local lang = vim.treesitter.language.get_lang(ft)

        if not lang then
            return
        end

        local ok_add = pcall(vim.treesitter.language.add, lang)
        if not ok_add then
            return
        end

        pcall(vim.treesitter.start, buf, lang)

        if ft ~= "yaml" and ft ~= "markdown" then
            vim.bo[buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
            vim.bo[buf].smartindent = false
            vim.bo[buf].cindent = false
        end
    end,
})
