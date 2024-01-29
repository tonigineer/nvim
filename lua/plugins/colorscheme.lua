-- return {
--     "EdenEast/nightfox.nvim",
--     config = function()
--         require("nightfox").setup({
--             options = {
--                 -- Compiled file's destination location
--                 compile_path = vim.fn.stdpath("cache") .. "/nightfox",
--                 compile_file_suffix = "_compiled", -- Compiled file suffix
--                 transparent = true, -- Disable setting background
--                 terminal_colors = false, -- Set terminal colors (vim.g.terminal_color_*) used in `:terminal`
--                 dim_inactive = false, -- Non focused panes set to alternative background
--                 module_default = true, -- Default enable value for modules
--                 colorblind = {
--                     enable = false, -- Enable colorblind support
--                     simulate_only = false, -- Only show simulated colorblind colors and not diff shifted
--                     severity = {
--                         protan = 0, -- Severity [0,1] for protan (red)
--                         deutan = 0, -- Severity [0,1] for deutan (green)
--                         tritan = 0, -- Severity [0,1] for tritan (blue)
--                     },
--                 },
--                 styles = { -- Style to be applied to different syntax groups
--                     comments = "NONE", -- Value is any valid attr-list value `:help attr-list`
--                     conditionals = "NONE",
--                     constants = "NONE",
--                     functions = "NONE",
--                     keywords = "NONE",
--                     numbers = "NONE",
--                     operators = "NONE",
--                     strings = "NONE",
--                     types = "NONE",
--                     variables = "NONE",
--                 },
--                 inverse = { -- Inverse highlight for different types
--                     match_paren = false,
--                     visual = false,
--                     search = false,
--                 },
--                 modules = { -- List of various plugins and additional options
--                     -- ...
--                 },
--             },
--             palettes = {},
--             specs = {},
--             groups = {},
--         })
--
--         -- setup must be called before loading
--         vim.cmd("colorscheme duskfox")
--     end,
-- }

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
                colors.bg = "#16161e"
                colors.bg_dark = "#16161e"
                colors.bg_float = "#16161e"
                colors.bg_highlight = "#16161e"
                colors.bg_popup = "#16161e"
                colors.bg_search = "#ff6767"
                colors.bg_sidebar = "#16161e"
                colors.bg_statusline = "#3b4261"
                colors.bg_visual = "#3b4261"
                colors.black = "#16161e"
                colors.blue = "#7aa2f7"
                colors.blue0 = "#FFF4E5"
                colors.blue1 = "#2ac3de"
                colors.blue2 = "#0db9d7"
                colors.blue5 = "#89ddff"
                colors.blue6 = "#b4f9f8"
                colors.blue7 = "#394b70"
                colors.border = "#266d6a"
                colors.border_highlight = "#61ffca"
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
                colors.green = "#FFF4E5"
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
                colors.terminal_black = "#16161e"
                colors.warning = "#e0af68"
                colors.yellow = "#e0af68"
            end,

            --- You can override specific highlights to use other groups or a hex color
            --- function will be called with a Highlights and ColorScheme table
            ---@param highlights Highlights
            ---@param colors ColorScheme
        })

    end,
}