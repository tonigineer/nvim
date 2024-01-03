return {
    "folke/tokyonight.nvim",

    config = function()
        require("tokyonight").setup({
            -- your configuration comes here
            -- or leave it empty to use the default settings
            style = "moon", -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
            light_style = "night", -- The theme is used when the background is set to light
            transparent = true, -- Enable this to disable setting the background color
            terminal_colors = true, -- Configure the colors used when opening a `:terminal` in [Neovim](https://github.com/neovim/neovim)
            styles = {
                -- Style to be applied to different syntax groups
                -- Value is any valid attr-list value for `:help nvim_set_hl`
                comments = { italic = true },
                keywords = { italic = true },
                functions = {},
                variables = {},
                -- Background styles. Can be "dark", "transparent" or "normal"
                sidebars = "dark", -- style for sidebars, see below
                floats = "dark", -- style for floating windows
            },
            -- sidebars = { "qf", "help" }, -- Set a darker background on sidebar-like windows. For example: `["qf", "vista_kind", "terminal", "packer"]`
            day_brightness = 0.3, -- Adjusts the brightness of the colors of the **Day** style. Number between 0 and 1, from dull to vibrant colors
            hide_inactive_statusline = false, -- Enabling this option, will hide inactive statuslines and replace them with a thin border instead. Should work with the standard **StatusLine** and **LuaLine**.
            dim_inactive = false, -- dims inactive windows
            lualine_bold = true, -- When `true`, section headers in the lualine theme will be bold

            --- You can override specific color groups to use other groups or a hex color
            --- function will be called with a ColorScheme table
            ---@param colors ColorScheme
            on_colors = function(colors)
                colors.bg = "#1a1b26"
                colors.bg_dark = "#16161e"
                colors.bg_float = "#16161e"
                colors.bg_highlight = "#292e42"
                colors.bg_popup = "#16161e"
                colors.bg_search = "#3d59a1"
                colors.bg_sidebar = "#16161e"
                colors.bg_statusline = "#16161e"
                colors.bg_visual = "#283457"
                colors.black = "#15161e"
                colors.blue = "#7aa2f7"
                colors.blue0 = "#FFF4E5"
                colors.blue1 = "#2ac3de"
                colors.blue2 = "#0db9d7"
                colors.blue5 = "#89ddff"
                colors.blue6 = "#b4f9f8"
                colors.blue7 = "#394b70"
                colors.border = "#15161e"
                colors.border_highlight = "#27a1b9"
                colors.comment = "#565f89"
                colors.cyan = "#7dcfff"
                colors.dark3 = "#545c7e"
                colors.dark5 = "#737aa2"
                colors.delta = {
                    add = "#266d6a",
                    delete = "#ff6767",
                }
                colors.diff = {
                    add = "#266d6a",
                    change = "#61ffca",
                    delete = "#ff6767",
                    text = "#FFF4E5",
                }
                colors.error = "#ff6767"
                colors.fg = "#c0caf5"
                colors.fg_dark = "#a9b1d6"
                colors.fg_float = "#c0caf5"
                colors.fg_gutter = "#3b4261"
                colors.fg_sidebar = "#a9b1d6"
                colors.git = {
                    add = "#266d6a",
                    change = "#61ffca",
                    delete = "#ff6767",
                    ignore = "#545c7e",
                }
                colors.gitSigns = {
                    add = "#266d6a",
                    change = "#61ffca",
                    delete = "#ff6767",
                }
                colors.green = "#9ece6a"
                colors.green1 = "#73daca"
                colors.green2 = "#41a6b5"
                colors.hint = "#1abc9c"
                colors.info = "#0db9d7"
                colors.magenta = "#bb9af7"
                colors.magenta2 = "#ff007c"
                colors.none = "NONE"
                colors.orange = "#ff9e64"
                colors.purple = "#9d7cd8"
                colors.red = "#f7768e"
                colors.red1 = "#db4b4b"
                colors.teal = "#1abc9c"
                colors.terminal_black = "#140e1a"
                colors.warning = "#e0af68"
                colors.yellow = "#e0af68"
            end,

            --- You can override specific highlights to use other groups or a hex color
            --- function will be called with a Highlights and ColorScheme table
            ---@param highlights Highlights
            ---@param colors ColorScheme
            -- on_highlights = function(hl, c)
            --     local prompt = "#2d3149"
            --     hl.TelescopeNormal = {
            --       bg = c.bg_dark,
            --       fg = c.fg_dark,
            --     }
            --     hl.TelescopeBorder = {
            --       bg = c.bg_dark,
            --       fg = c.bg_dark,
            --     }
            --     hl.TelescopePromptNormal = {
            --       bg = prompt,
            --     }
            --     hl.TelescopePromptBorder = {
            --       bg = prompt,
            --       fg = prompt,
            --     }
            --     hl.TelescopePromptTitle = {
            --       bg = prompt,
            --       fg = prompt,
            --     }
            --     hl.TelescopePreviewTitle = {
            --       bg = c.bg_dark,
            --       fg = c.bg_dark,
            --     }
            --     hl.TelescopeResultsTitle = {
            --       bg = c.bg_dark,
            --       fg = c.bg_dark,
            --     }
            --   end,
        })

        vim.cmd.colorscheme("catppuccin")
    end,
}

-- return {
--     "catppuccin/nvim",
--     config = function()
--         local config = require("catppuccin")
--         config.setup({
--             flavour = "mocha", -- latte, frappe, macchiato, mocha
--             background = { -- :h background
--                 light = "latte",
--                 dark = "macchiato",
--             },
--             transparent_background = true, -- disables setting the background color.
--             show_end_of_buffer = false, -- shows the '~' characters after the end of buffers
--             term_colors = true, -- sets terminal colors (e.g. `g:terminal_color_0`)
--             dim_inactive = {
--                 enabled = false, -- dims the background color of inactive window
--                 shade = "dark",
--                 percentage = 0.9, -- percentage of the shade to apply to the inactive window
--             },
--             no_italic = false, -- Force no italic
--             no_bold = false, -- Force no bold
--             no_underline = false, -- Force no underline
--             styles = { -- Handles the styles of general hi groups (see `:h highlight-args`):
--                 comments = { "italic" }, -- Change the style of comments
--                 conditionals = { "italic" },
--                 loops = {},
--                 functions = {},
--                 keywords = {},
--                 strings = {},
--                 variables = {},
--                 numbers = {},
--                 booleans = {},
--                 properties = {},
--                 types = {},
--                 operators = {},
--             },
--             color_overrides = {
--                 all = {},
--                 mocha = {
--                     rosewater = "#f5e0dc",
--                     flamingo = "#f2cdcd",
--                     pink = "#f5c2e7",
--                     mauve = "#cba6f7",
--                     red = "#f38ba8",
--                     maroon = "#eba0ac",
--                     peach = "#fab387",
--                     yellow = "#f9e2af",
--                     green = "#a6e3a1",
--                     teal = "#94e2d5",
--                     sky = "#89dceb",
--                     sapphire = "#74c7ec",
--                     blue = "#89b4fa",
--                     lavender = "#b4befe",
--                     text = "#cdd6f4",
--                     subtext1 = "#bac2de",
--                     subtext0 = "#a6adc8",
--                     overlay2 = "#9399b2",
--                     overlay1 = "#7f849c",
--                     overlay0 = "#6c7086",
--                     surface2 = "#585b70",
--                     surface1 = "#45475a",
--                     surface0 = "#313244",
--                     base = "#1e1e2e",
--                     mantle = "#181825",
--                     crust = "#11111b",
--                 },
--             },
--             custom_highlights = function(colors)
--                 return {
--                     Comment = { fg = colors.flamingo },
--                     TabLineSel = { bg = colors.pink },
--                     CmpBorder = { fg = colors.surface2 },
--                     Pmenu = { bg = colors.none },
--                 }
--             end,
--             integrations = {
--                 aerial = true,
--                 alpha = true,
--                 cmp = true,
--                 dashboard = true,
--                 flash = true,
--                 gitsigns = true,
--                 headlines = true,
--                 illuminate = true,
--                 indent_blankline = { enabled = true },
--                 leap = true,
--                 lsp_trouble = true,
--                 mason = true,
--                 markdown = true,
--                 mini = true,
--                 native_lsp = {
--                     enabled = true,
--                     underlines = {
--                         errors = { "undercurl" },
--                         hints = { "undercurl" },
--                         warnings = { "undercurl" },
--                         information = { "undercurl" },
--                     },
--                 },
--                 navic = { enabled = true, custom_bg = "lualine" },
--                 neotest = true,
--                 neotree = true,
--                 noice = true,
--                 notify = true,
--                 semantic_tokens = true,
--                 telescope = true,
--                 treesitter = true,
--                 treesitter_context = true,
--                 which_key = true,
--                 -- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
--             },
--         })
--         vim.cmd.colorscheme("catppuccin")
--     end,
-- }

