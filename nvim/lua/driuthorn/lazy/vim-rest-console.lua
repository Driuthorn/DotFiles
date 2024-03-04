return {
    'diepm/vim-rest-console',
    name = "vcm",
    config = function()
        vim.g.vrc_set_default_mapping = 0
        vim.g.vrc_set_default_content_type = 'application/json'
        vim.g.vrc_set_output_buffer_name = '_OUTPUT.json'
        vim.g.vrc_auto_format_Response_patterns = {
            json = 'jq',
        }

      vim.keymap.set("n", "<leader>xr", ":call VrcQuery()")
    end
}
