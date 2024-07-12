-- -- Have a look here: https://github.com/folke/tokyonight.nvim/blob/main/extras/lua/tokyonight_night.lua
--
-- return {
--     "folke/tokyonight.nvim",
--     lazy = false,
--     priority = 1000,
--     opts = {},
--
--     config = function()
--         require("tokyonight").setup({
--             style = "moon", -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
--             light_style = "day", -- The theme is used when the background is set to light
--             transparent = true, -- Enable this to disable setting the background color
--             terminal_colors = true, -- Configure the colors used when opening a `:terminal` in [Neovim](https://github.com/neovim/neovim)
--             styles = {
--                 -- Value is any valid attr-list value for `:help nvim_set_hl`
--                 comments = { italic = true },
--                 keywords = { italic = false },
--                 functions = {},
--                 variables = {},
--                 -- Background styles. Can be "dark", "transparent" or "normal"
--                 sidebars = "transparent", -- style for sidebars, see below
--                 floats = "transparent", -- style for floating windows
--             },
--             sidebars = { "qf", "help" }, -- Set a darker background on sidebar-like windows. For example: `["qf", "vista_kind", "terminal", "packer"]`
--             day_brightness = 0.3, -- Adjusts the brightness of the colors of the **Day** style. Number between 0 and 1, from dull to vibrant colors
--             hide_inactive_statusline = true, -- Enabling this option, will hide inactive statuslines and replace them with a thin border instead. Should work with the standard **StatusLine** and **LuaLine**.
--             dim_inactive = true, -- dims inactive windows
--             lualine_bold = false, -- When `true`, section headers in the lualine theme will be bold
--
--             --- You can override specific color groups to use other groups or a hex color
--             --- function will be called with a ColorScheme table
--             ---@class colors ColorScheme
--             on_colors = function(colors)
--                 -- local default_colors = {
--                 --     _name = "tokyonight_night",
--                 --     bg = "#1a1b26",
--                 --     bg_dark = "#16161e",
--                 --     bg_float = "#16161e",
--                 --     bg_highlight = "#292e42",
--                 --     bg_popup = "#16161e",
--                 --     bg_search = "#3d59a1",
--                 --     bg_sidebar = "#16161e",
--                 --     bg_statusline = "#16161e",
--                 --     bg_visual = "#283457",
--                 --     black = "#15161e",
--                 --     blue = "#7aa2f7",
--                 --     blue0 = "#3d59a1",
--                 --     blue1 = "#2ac3de",
--                 --     blue2 = "#0db9d7",
--                 --     blue5 = "#89ddff",
--                 --     blue6 = "#b4f9f8",
--                 --     blue7 = "#394b70",
--                 --     border = "#15161e",
--                 --     border_highlight = "#27a1b9",
--                 --     comment = "#565f89",
--                 --     cyan = "#7dcfff",
--                 --     dark3 = "#545c7e",
--                 --     dark5 = "#737aa2",
--                 --     delta = {
--                 --         add = "#2c5a66",
--                 --         delete = "#713137",
--                 --     },
--                 --     diff = {
--                 --         add = "#20303b",
--                 --         change = "#1f2231",
--                 --         delete = "#37222c",
--                 --         text = "#394b70",
--                 --     },
--                 --     error = "#db4b4b",
--                 --     fg = "#c0caf5",
--                 --     fg_dark = "#a9b1d6",
--                 --     fg_float = "#c0caf5",
--                 --     fg_gutter = "#3b4261",
--                 --     fg_sidebar = "#a9b1d6",
--                 --     git = {
--                 --         add = "#449dab",
--                 --         change = "#6183bb",
--                 --         delete = "#914c54",
--                 --         ignore = "#545c7e",
--                 --     },
--                 --     gitSigns = {
--                 --         add = "#266d6a",
--                 --         change = "#536c9e",
--                 --         delete = "#b2555b",
--                 --     },
--                 --     green = "#9ece6a",
--                 --     green1 = "#73daca",
--                 --     green2 = "#41a6b5",
--                 --     hint = "#1abc9c",
--                 --     info = "#0db9d7",
--                 --     magenta = "#bb9af7",
--                 --     magenta2 = "#ff007c",
--                 --     none = "NONE",
--                 --     orange = "#ff9e64",
--                 --     purple = "#9d7cd8",
--                 --     red = "#f7768e",
--                 --     red1 = "#db4b4b",
--                 --     teal = "#1abc9c",
--                 --     terminal_black = "#414868",
--                 --     todo = "#7aa2f7",
--                 --     warning = "#e0af68",
--                 --     yellow = "#e0af68",
--                 -- }
--
--                 -- colors.green = "#61ffca"
--                 colors.white = "#FAF7FE"
--                 colors.blue = "#25C9F3"
--                 colors.red = "#ff6767"
--             end,
--             --
--             --- You can override specific highlights to use other groups or a hex color
--             --- function will be called with a Highlights and ColorScheme table
--             ---@class highlights Highlights
--             ---@class colors ColorScheme
--             on_highlights = function(hl, c)
--                 -- Telescope
--                 local title = "#61ffca"
--                 local prompt_text = "#FAF7FE"
--                 hl.TelescopeNormal = {
--                     bg = c.bg_none,
--                     fg = c.fg_dark,
--                 }
--                 hl.TelescopeBorder = {
--                     bg = c.bg_none,
--                     fg = c.fg_dark,
--                 }
--                 hl.TelescopePromptNormal = {
--                     bg = c.bg_none,
--                     fg = prompt_text,
--                 }
--                 hl.TelescopePromptBorder = {
--                     bg = c.bg_none,
--                     fg = c.fg_dark,
--                 }
--                 hl.TelescopePromptTitle = {
--                     bg = c.bg_none,
--                     fg = title,
--                 }
--                 hl.TelescopePreviewTitle = {
--                     bg = c.bg_none,
--                     fg = title,
--                 }
--                 hl.TelescopeResultsTitle = {
--                     bg = c.bg_none,
--                     fg = title,
--                 }
--                 -- Lines/Indents/Comments
--                 local help_gray = "#3f404f"
--                 hl.Comment = {
--                     fg = help_gray,
--                 }
--                 hl.LineNr = {
--                     fg = help_gray,
--                 }
--                 hl.LineNrAbove = {
--                     fg = help_gray,
--                 }
--                 hl.LineNrBelow = {
--                     fg = help_gray,
--                 }
--                 hl.IndentBlanklineChar = {
--                     fg = help_gray,
--                     nocombine = true,
--                 }
--                 hl.IndentBlanklineContextChar = {
--                     fg = "#2ac3de",
--                     nocombine = true,
--                 }
--                 hl.IndentLine = {
--                     fg = help_gray,
--                     nocombine = true,
--                 }
--                 hl.IndentLineCurrent = {
--                     fg = "#2ac3de",
--                     nocombine = true,
--                 }
--                 hl.IblIndent = {
--                     fg = help_gray,
--                     nocombine = true,
--                 }
--                 hl.IblScope = {
--                     fg = "#2ac3de",
--                     nocombine = true,
--                 }
--
--                 -- Cursor
--                 hl.CursorLineNr = {
--                     bold = true,
--                     fg = "#ff6767",
--                 }
--                 hl.CursorLine = {
--                     bg = "#1f2231",
--                 }
--
--                 -- Syntax
--                 hl.Constant = {
--                     fg = "#ff6767",
--                 }
--
--                 -- Git sign bars
--                 hl.GitSignsAdd = {
--                     fg = "#61ffca",
--                 }
--                 hl.GitSignsChange = {
--                     fg = "#e0af68",
--                 }
--                 hl.GitSignsDelete = {
--                     fg = "#ff6767",
--                 }
--                 hl.GitSignsText = {
--                     fg = "#394b70",
--                 }
--             end,
--         })
--         vim.cmd([[colorscheme tokyonight]])
--     end,
-- }
--
--
-- return {
--     "EdenEast/nightfox.nvim",
--     config = function()
--         require("nightfox").setup({
--             options = {
--                 -- Compiled file's destination location
--                 compile_path = vim.fn.stdpath("cache") .. "/nightfox",
--                 compile_file_suffix = "_compiled", -- Compiled file suffix
--                 transparent = true, -- Disable setting background
--                 terminal_colors = true, -- Set terminal colors (vim.g.terminal_color_*) used in `:terminal`
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
--
--
return {
    "rose-pine/neovim",
    config = function()
        require("rose-pine").setup({
            variant = "moon", -- auto, main, moon, or dawn
            dark_variant = "moon", -- main, moon, or dawn
            dim_inactive_windows = false,
            extend_background_behind_borders = true,

            enable = {
                terminal = true,
                legacy_highlights = true, -- Improve compatibility for previous versions of Neovim
                migrations = true, -- Handle deprecated options automatically
            },

            styles = {
                bold = true,
                italic = false,
                transparency = true,
            },

            groups = {
                border = "muted",
                link = "iris",
                panel = "surface",

                error = "love",
                hint = "iris",
                info = "foam",
                note = "pine",
                todo = "rose",
                warn = "gold",

                git_add = "foam",
                git_change = "rose",
                git_delete = "love",
                git_dirty = "rose",
                git_ignore = "muted",
                git_merge = "iris",
                git_rename = "pine",
                git_stage = "iris",
                git_text = "rose",
                git_untracked = "subtle",

                h1 = "iris",
                h2 = "foam",
                h3 = "rose",
                h4 = "gold",
                h5 = "pine",
                h6 = "foam",
            },

            highlight_groups = {
                -- Comment = { fg = "foam" },
                -- VertSplit = { fg = "muted", bg = "muted" },
            },

            before_highlight = function(group, highlight, palette)
                -- Disable all undercurls
                -- if highlight.undercurl then
                --     highlight.undercurl = false
                -- end
                --
                -- Change palette colour
                -- if highlight.fg == palette.pine then
                --     highlight.fg = palette.foam
                -- end
            end,
        })

        vim.cmd("colorscheme rose-pine")
        -- vim.cmd("colorscheme rose-pine-main")
        -- vim.cmd("colorscheme rose-pine-moon")
        -- vim.cmd("colorscheme rose-pine-dawn")
    end,
}
