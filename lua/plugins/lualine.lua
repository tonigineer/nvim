return {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    init = function()
        vim.g.lualine_laststatus = vim.o.laststatus
        if vim.fn.argc(-1) > 0 then
            -- set an empty statusline till lualine loads
            vim.o.statusline = " "
        else
            -- hide the statusline on the starter page
            vim.o.laststatus = 0
        end
    end,

    opts = function()
        -- Eviline config for lualine
        -- Author: shadmansaleh
        -- Credit: glepnir
        -- local lualine = require("lualine")

        -- Color table for highlights
        -- stylua: ignore
        local colors = {
            bg      = 'none',
            fg      = '#FAF7FE',
            yellow  = '#ffca85',
            green   = '#61ffca',
            magenta = '#25C9F3',
            red     = '#ff6767',
            gray    = '#BFBDCB'
            -- cyan     = '#008080',
            -- darkblue = '#0b111b',
            -- blue     = '#51afef',
            -- orange   = '#FF8800',
            -- violet   = '#a9a1e1',
        }

        local conditions = {
            buffer_not_empty = function()
                return vim.fn.empty(vim.fn.expand("%:t")) ~= 1
            end,
            hide_in_width = function() return vim.fn.winwidth(0) > 80 end,
            check_git_workspace = function()
                local filepath = vim.fn.expand("%:p:h")
                local gitdir = vim.fn.finddir(".git", filepath .. ";")
                return gitdir and #gitdir > 0 and #gitdir < #filepath
            end,
        }

        -- Config
        local config = {
            options = {
                -- Disable sections and component separators
                component_separators = "",
                section_separators = "",
                theme = {
                    -- We are going to use lualine_c an lualine_x as left and
                    -- right section. Both are highlighted by c theme .  So we
                    -- are just setting default looks o statusline
                    normal = { c = { fg = colors.fg, bg = colors.bg } },
                    inactive = { c = { fg = colors.fg, bg = colors.bg } },
                },
                globalstatus = true,
                disabled_filetypes = {
                    statusline = { "dashboard", "alpha", "starter" },
                },
            },
            sections = {
                -- these are to remove the defaults
                lualine_a = {},
                lualine_b = {},
                lualine_y = {},
                lualine_z = {},
                -- These will be filled later
                lualine_c = {},
                lualine_x = {},
            },
            inactive_sections = {
                -- these are to remove the defaults
                lualine_a = {},
                lualine_b = {},
                lualine_y = {},
                lualine_z = {},
                lualine_c = {},
                lualine_x = {},
            },
        }

        -- Inserts a component in lualine_c at left section
        local function ins_left(component)
            table.insert(config.sections.lualine_c, component)
        end

        -- Inserts a component in lualine_x at right section
        local function ins_right(component)
            table.insert(config.sections.lualine_x, component)
        end

        ins_left({
            function() return "▊" end,
            color = { fg = colors.blue }, -- Sets highlighting of component
            padding = { left = 0, right = 1 }, -- We don't need space before this
        })

        ins_left({
            -- mode component
            function()
                local mode = {
                    n = " NORMAL",
                    i = " INSERT",
                    v = " VISUAL",
                    [""] = " VISUAL",
                    V = " VISUAL-LINE",
                    t = " TERMINAL",
                    c = " COMMAND",
                }
                return mode[vim.fn.mode()]
            end,
            color = function()
                -- auto change color according to neovims mode
                local mode_color = {
                    n = colors.red,
                    i = colors.green,
                    v = colors.magenta,
                    [""] = colors.magenta,
                    V = colors.magenta,
                    c = colors.magenta,
                    no = colors.red,
                    s = colors.yellow,
                    S = colors.yellow,
                    [""] = colors.yellow,
                    ic = colors.yellow,
                    R = colors.magenta,
                    Rv = colors.magenta,
                    cv = colors.red,
                    ce = colors.red,
                    r = colors.green,
                    rm = colors.green,
                    ["r?"] = colors.green,
                    ["!"] = colors.red,
                    t = colors.red,
                }
                return {
                    fg = colors.white,
                    -- fg = mode_color[vim.fn.mode()],
                    bg = mode_color[vim.fn.mode()],
                }
            end,
            padding = { right = 1 },
        })

        ins_left({
            -- filesize component
            "filesize",
            cond = conditions.buffer_not_empty,
        })

        ins_left({
            "filename",
            cond = conditions.buffer_not_empty,
            color = { fg = colors.magenta, gui = "bold" },
        })

        ins_left({ "location" })

        ins_left({ "progress", color = { fg = colors.fg, gui = "bold" } })

        ins_left({
            "diagnostics",
            sources = { "nvim_diagnostic" },
            symbols = { error = " ", warn = " ", info = " " },
            diagnostics_color = {
                color_error = { fg = colors.red },
                color_warn = { fg = colors.yellow },
                color_info = { fg = colors.green },
            },
        })

        -- Insert mid section. You can make any number of sections in neovim :)
        -- for lualine it's any number greater then 2
        ins_left({
            function() return "%=" end,
        })

        ins_left({
            -- Lsp server name .
            function()
                local msg = "No Active Lsp"
                local buf_ft = vim.api.nvim_buf_get_option(0, "filetype")
                local clients = vim.lsp.get_active_clients()
                if next(clients) == nil then return msg end
                for _, client in ipairs(clients) do
                    local filetypes = client.config.filetypes
                    if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
                        return client.name
                    end
                end
                return msg
            end,
            icon = " LSP:",
            color = { fg = colors.green, gui = "bold" },
        })

        -- Add components to right sections
        ins_right({
            "o:encoding", -- option component same as &encoding in viml
            fmt = string.upper, -- I'm not sure why it's upper case either ;)
            cond = conditions.hide_in_width,
            color = { fg = colors.fg, gui = "bold" },
        })

        ins_right({
            "fileformat",
            fmt = string.upper,
            icons_enabled = false, -- I think icons are cool but Eviline doesn't have them. sigh
            color = { fg = colors.fg, gui = "bold" },
        })

        ins_right({
            "branch",
            icon = "",
            color = { fg = colors.fg, gui = "bold" },
        })

        ins_right({
            "diff",
            -- Is it me or the symbol for modified us really weird
            symbols = { added = " ", modified = "󰝤 ", removed = " " },
            diff_color = {
                added = { fg = colors.green },
                modified = { fg = colors.yellow },
                removed = { fg = colors.red },
            },
            cond = conditions.hide_in_width,
        })

        ins_right({
            function() return "▊" end,
            color = { fg = colors.magenta },
            padding = { left = 1 },
        })

        -- -- Now don't forget to initialize lualine
        -- lualine.setup(config)
        --
        return config
    end,
}
