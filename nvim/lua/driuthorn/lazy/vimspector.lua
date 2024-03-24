return {
    'puremourning/vimspector',
    config = function()
        vim.cmd([[
            let g:vimspector_sidebar_width = 85
            let g:vimspector_bottombar_height = 15
            let g:vimspector_terminal_maxwidth = 70
        ]])

        vim.keymap.set("n", "<F8>", ":call vimspector#Reset()<cr>")
        vim.keymap.set("n", "<F9>", ":call vimspector#Launch()<cr>")
        vim.keymap.set("n", "<F10>", ":call vimspector#StepInto()<cr>")
        vim.keymap.set("n", "<F11>", ":call vimspector#StepOver()<cr>")
        vim.keymap.set("n", "<F12>", ":call vimspector#StepOut()<cr>")

        vim.keymap.set("n", "Db", ":call vimspector#ToggleBreakpoint()<cr>")
        vim.keymap.set("n", "Dw", ":call vimspector#AddWatch()<cr>")
        vim.keymap.set("n", "De", ":call vimspector#Evaluate()<cr>")
    end

}
