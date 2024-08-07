return {
    'glepnir/galaxyline.nvim',
    branch = 'main',
    dependencies = { 'nvim-web-devicons' },
    config = function()
        local gl = require("galaxyline")
        local gls = gl.section

        local fileinfo = require("galaxyline.provider_fileinfo")
        local vcs = require("galaxyline.provider_vcs")
        local condition = require("galaxyline.condition")
        local lspclient = require("galaxyline.provider_lsp")

        local colors = {
            bg = "#222222",
            black = "#000000",
            white = "#ffffff",
            accent_light = "#c2d5ff",
            accent = "#5f87d7",
            accent_dark = "#00236e",
            alternate = "#8fbcbb",
            alternate_dark = "#005f5f",
            yellow = "#fabd2f",
            cyan = "#008080",
            darkblue = "#081633",
            green = "#afd700",
            orange = "#FF8800",
            purple = "#5d4d7a",
            magenta = "#d16d9e",
            grey = "#555555",
            blue = "#0087d7",
            red = "#ec5f67",
            pink = "#e6a1e2",
        }

        local function highlight(name, fg, bg, style)
            local cmd = "hi " .. name .. " guibg=" .. bg .. " guifg=" .. fg
            if style then
                cmd = cmd .. " gui=" .. style
            end

            vim.api.nvim_command(cmd)
        end

        local function hi_link(name1, name2)
            vim.api.nvim_command("hi link " .. name1 .. " " .. name2)
        end

        local function mix_colors(color_1, color_2, weight)
            local d2h = function(d)
                return string.format("%x", d)
            end

            local h2d = function(h)
                return tonumber(h, 16)
            end

            color_1 = string.sub(color_1, 1, -1)
            color_2 = string.sub(color_2, 1, -1)

            weight = weight or 50

            local color = "#"

            for i = 2, 6, 2 do
                local v1 = h2d(string.sub(color_1, i, i + 1))
                local v2 = h2d(string.sub(color_2, i, i + 1))

                local val = d2h(math.floor(v2 + (v1 - v2) * (weight / 100.0)))

                while (string.len(val) < 2) do val = '0' .. val end

                color = color .. val
            end

            return color;
        end

        local function generate_mode_colors()
            local mode_colors = {
                n      = { colors.accent_light, colors.accent },
                no     = { colors.accent_light, colors.accent },
                v      = { colors.black, colors.yellow },
                V      = { colors.black, colors.yellow },
                [""]  = { colors.black, colors.yellow },
                s      = { colors.black, colors.orange },
                S      = { colors.black, colors.orange },
                [""]  = { colors.black, colors.orange },
                i      = { colors.alternate, colors.alternate_dark },
                ic     = { colors.alternate, colors.alternate_dark },
                ix     = { colors.alternate, colors.alternate_dark },
                R      = { colors.black, colors.green },
                Rc     = { colors.black, colors.green },
                Rv     = { colors.black, colors.green },
                Rx     = { colors.black, colors.green },
                c      = { colors.white, colors.red },
                cv     = { colors.white, colors.red },
                ce     = { colors.white, colors.red },
                r      = { colors.black, colors.cyan },
                rm     = { colors.black, colors.cyan },
                ["r?"] = { colors.black, colors.cyan },
                ["!"]  = { colors.black, colors.white },
                t      = { colors.black, colors.white },
            }

            local full_table = {}
            for mode, values in pairs(mode_colors) do
                local main_bg = values[2]
                local base_fg = values[1]
                local dim_bg
                local dimmer_bg = mix_colors(main_bg, colors.bg, 20)
                local main_fg
                local dim_fg

                if base_fg == colors.white or base_fg == colors.black then
                    if base_fg == colors.black then
                        dim_bg = mix_colors(main_bg, colors.bg, 40)
                        main_fg = mix_colors(main_bg, colors.black, 50)
                        dim_fg = main_bg
                    else
                        dim_bg = mix_colors(main_bg, colors.bg, 50)
                        main_fg = mix_colors(main_bg, colors.white, 30)
                        dim_fg = mix_colors(main_bg, colors.white, 50)
                    end
                else
                    main_fg = base_fg
                    dim_bg = mix_colors(main_bg, colors.bg, 50)
                    dim_fg = mix_colors(main_fg, dim_bg, 80)
                end

                full_table[mode] = {
                    main_fg = main_fg,
                    main_bg = main_bg,
                    dim_fg = dim_fg,
                    dim_bg = dim_bg,
                    dimmer_bg = dimmer_bg,
                }
            end

            return full_table
        end

        local mode_colors = generate_mode_colors()

        highlight("GalaxySearchResult", mix_colors(colors.yellow, colors.black, 50), colors.yellow)
        highlight("GalaxyTrailing", mix_colors(colors.red, colors.white, 30), colors.red)
        hi_link("GalaxyInnerSeparator1", "GalaxySection1")
        hi_link("GalaxyInnerSeparator2", "GalaxySection2")

        local function search_results_available()
            local search_count = vim.fn.searchcount({
                recompute = 1,
                maxcount = -1,
            })

            return vim.v.hlsearch == 1 and search_count.total > 0
        end

        gls.left[1] = {
            ViMode = {
                provider = function()
                    local alias = {
                        n = "NORMAL",
                        no = "N OPERATOR",
                        v = "VISUAL",
                        V = "V LINE",
                        [""] = "V BLOCK",
                        s = "SELECT",
                        S = "S LINE",
                        [""] = "S BLOCK",
                        i = "INSERT",
                        ic = "I COMPLETION",
                        ix = "I X COMP",
                        R = "REPLACE",
                        Rc = "R COMPLETION",
                        Rv = "R VIRTUAL",
                        Rx = "R X COMP",
                        c = "COMMAND",
                        cv = "EX",
                        r = "PROMPT",
                        rm = "MORE",
                        ["r?"] = "CONFIRM",
                        ["!"] = "EXT COMMAND",
                        t = "TERMINAL",
                    }

                    local mode = vim.fn.mode()
                    local c = mode_colors[mode]

                    local search_results = search_results_available()

                    if search_results then
                        highlight("GalaxySearchResultEdge", colors.yellow, c.main_bg)
                        highlight("GalaxyTrailingEdge", colors.red, colors.yellow)
                    else
                        highlight("GalaxyTrailingEdge", colors.red, c.main_bg)
                    end

                    highlight("GalaxylineFillSection", c.dimmer_bg, c.dimmer_bg)
                    highlight("GalaxyMidText", c.dim_fg, c.dimmer_bg)

                    highlight("GalaxySection1", c.main_fg, c.main_bg)
                    highlight("GalaxySection1Edge", c.main_bg, c.dim_bg)
                    highlight("GalaxySection2", c.dim_fg, c.dim_bg)
                    highlight("GalaxySection2Bright", colors.white, c.dim_bg)
                    highlight("GalaxySection2Edge", c.dim_bg, c.dimmer_bg)

                    highlight("GalaxyViMode", c.main_fg, c.main_bg, "bold")
                    highlight("GalaxyEditIcon", colors.red, c.dimmer_bg)

                    return '  ' .. alias[vim.fn.mode()] .. ' '
                end,
                separator = "",
                separator_highlight = "GalaxySection1Edge",
                highlight = "GalaxySection1",
            }
        }

        gls.left[2] = {
            Git = {
                provider = function()
                    if (condition.check_git_workspace() and not vim.bo.readonly) then
                            local gitIcon = '  '
                            local branch = vcs.get_git_branch() .. ' '

                            return gitIcon .. branch
                    else
                        return ''
                    end
                end,
                highlight = "GalaxySection2",
                separator = "",
                separator_highlight = "GalaxyInnerSeparator2"
            }
        }

        gls.left[3] = {
            LspServer = {
                provider = function()
                    local curr_client = lspclient.get_lsp_client()
                    if curr_client ~= "No Active Lsp" then
                        return ' ' .. curr_client .. ' '
                    end
                end,
                highlight = "GalaxySection2",
            }
        }

        -- TODO: Show Git Status on line
        -- gls.left[3] = {
        --     GitStatus = {
        --         provider = function()

        --             print(vim.fn.exists('b:gitsigns_status'))
        --             print(vcs.diff_add())
        --             print(vcs.diff_modified())
        --             print(vcs.diff_remove())

        --             if (condition.check_git_workspace()) then
        --                 local edit_icon = ''
        --                 local add_icon = ''
        --                 local rem_icon = ''
        --                 local icons = ''
        --                 local contains_add = vcs.diff_add()
        --                 local contains_edit = vcs.diff_modified()
        --                 local contains_rem = vcs.diff_remove()

        --                 if contains_add then
        --                     icons = icons .. contains_add .. add_icon .. ' '
        --                 end

        --                 if contains_edit then
        --                     icons = icons .. contains_edit .. edit_icon .. ' '
        --                 end

        --                 if contains_rem then
        --                     icons = icons .. contains_rem .. rem_icon .. ' '
        --                 end

        --                 return icons
        --             else
        --                 return ''
        --             end
        --         end,
        --         highlight = "GalaxySection2",
        --     }
        -- }

        gls.left[4] = {
            LspFunction = {
                provider = function()
                    local current_function = vim.b.lsp_current_function
                    if current_function and current_function ~= '' then
                        return ' ' .. current_function .. ' '
                    end
                end,
                separator = "",
                separator_highlight = "GalaxySection2Edge",
                highlight = "GalaxySection2",
            }
        }

        gls.mid[1] = {
            FileIcon = {
                provider = function()
                    return ' ' .. fileinfo.get_file_icon()
                end,
                highlight = "GalaxyMidText",
            }
        }

        gls.mid[2] = {
            CurrentFile = {
                provider = function()
                    local path = fileinfo.filename_in_special_buffer()
                    if not path or path == '' then
                        path = "[No Name]"
                    end

                    return path
                end,
                highlight = "GalaxyMidText"
            }
        }

        gls.mid[3] = {
            Tilde = {
                provider = function()
                    local file_size = fileinfo.get_file_size()
                    if file_size and file_size ~= '' then
                        return '  ~ '
                    else
                        return ' '
                    end
                end,
                highlight = "GalaxyEditIcon"
            }
        }

        gls.mid[4] = {
            FileSize = {
                provider = fileinfo.get_file_size,
                highlight = "GalaxyMidText",
            }
        }

        gls.right[5] = {
            Percent = {
                provider = function()
                    return fileinfo.current_line_percent()
                end,
                highlight = "GalaxySection1",
                separator = "",
                separator_highlight = "GalaxyInnerSeparator1",
            }
        }

        gls.right[4] = {
            LineColumn = {
                provider = function()
                    local mode = vim.fn.mode()
                    if mode == 'v' or mode == 'V' or mode == "" then
                        local lstart = vim.fn.line("v")
                        local lend = vim.fn.line(".")
                        local cstart = vim.fn.col("v")
                        local cend = vim.fn.col(".")
                        return '  ' ..
                            lstart ..
                            ':' ..
                            lend ..
                            '/' .. vim.fn.line('$') .. '  ' .. cstart .. ':' .. cend .. '/' .. vim.fn.col('$') .. ' '
                    else
                        return '  ' ..
                            vim.fn.line(".") ..
                            '/' .. vim.fn.line('$') .. '  ' .. vim.fn.col(".") .. '/' .. vim.fn.col('$') .. ' '
                    end
                end,
                highlight = "GalaxySection1",
                separator = "",
                separator_highlight = "GalaxySection1Edge",
            }
        }

        gls.right[3] = {
            Encode = {
                provider = function()
                    local encoding = vim.bo.fenc
                    if encoding and encoding ~= '' then
                        return ' ' .. encoding .. ' '
                    end
                end,
                highlight = "GalaxySection2",
            }
        }

        gls.right[2] = {
            Format = {
                provider = function()
                    local format = vim.bo.fileformat
                    local icon
                    if format == "unix" then
                        icon = ''
                    elseif format == "dos" then
                        icon = ''
                    elseif format == "mac" then
                        icon = ''
                    end
                    return ' ' .. icon .. ' '
                end,
                highlight = "GalaxySection2Bright",
            }
        }

        gls.right[1] = {
            FileType = {
                provider = function()
                    local filetype = vim.bo.filetype
                    if filetype and filetype ~= '' then
                        return ' ' .. filetype .. ' '
                    end
                end,
                highlight = "GalaxySection2",
                separator = "",
                separator_highlight = "GalaxySection2Edge",
            }
        }
    end
}
