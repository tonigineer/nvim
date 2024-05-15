-- return {
--     "rebelot/kanagawa.nvim",

--     config = function()
--         -- Default options:
--         require("kanagawa").setup({
--             compile = false, -- enable compiling the colorscheme
--             undercurl = true, -- enable undercurls
--             commentStyle = { italic = true },
--             functionStyle = {},
--             keywordStyle = { italic = true },
--             statementStyle = { bold = true },
--             typeStyle = {},
--             transparent = false, -- do not set background color
--             dimInactive = false, -- dim inactive window `:h hl-NormalNC`
--             terminalColors = true, -- define vim.g.terminal_color_{0,17}
--             colors = { -- add/modify theme and palette colors
--                 palette = {},
--                 theme = {
--                     wave = {},
--                     lotus = {},
--                     dragon = {},
--                     all = {
--                         ui = {
--                             fg = "#FAF7FE",
--                             fg_dim = "#BFBDCB",
--                             fg_reverse = "#25C9F3",

--                             bg_dim = "none",
--                             bg_gutter = "none",

--                             bg_m3 = "none",
--                             bg_m2 = "none",
--                             bg_m1 = "none",
--                             bg = "none",
--                             bg_p1 = "none",
--                             bg_p2 = "none",

--                             special = "#61ffca",
--                             nontext = "#454545",
--                             whitespace = "#454545",

--                             bg_search = "none",
--                             bg_visual = "#454545",

--                             pmenu = {
--                                 fg = "#454545",
--                                 fg_sel = "#FAF7FE",
--                                 bg = "none",
--                                 bg_sel = "none",
--                                 bg_sbar = "none",
--                                 bg_thumb = "none",
--                             },
--                             float = {
--                                 fg = "#FAF7FE",
--                                 bg = "none",
--                                 fg_border = "#25C9F3",
--                                 bg_border = "none",
--                             },
--                         },
--                         syn = {
--                             string = "#61ffca",
--                             variable = "#25C9F3",
--                             number = "#ff6767",
--                             constant = "#ff6767",
--                             identifier = "#FAF7FE",
--                             parameter = "#FAF7FE",
--                             fun = "#61ffca",
--                             statement = "#61ffca",
--                             keyword = "#25C9F3",
--                             operator = "#25C9F3",
--                             preproc = "#ffca85",
--                             type = "#61ffca",
--                             regex = "#ffca85",
--                             deprecated = "#454545",
--                             comment = "#787878",
--                             punct = "#25C9F3",
--                             special1 = "#ffca85",
--                             special2 = "#FAF7FE",
--                             special3 = "#25C9F3",
--                         },
--                         vcs = {
--                             added = "#61ffca",
--                             removed = "#ff6767",
--                             changed = "#ffca85",
--                         },
--                         diff = {
--                             add = "#61ffca",
--                             delete = "#ff6767",
--                             change = "#ffca85",
--                             text = "#FAF7FE",
--                         },
--                         diag = {
--                             ok = "#61ffca",
--                             error = "#ff6767",
--                             warning = "#ffca85",
--                             info = "#FAF7FE",
--                             hint = "#25C9F3",
--                         },
--                         term = {
--                             "", -- black
--                             "", -- red
--                             "", -- green
--                             "", -- yellow
--                             "", -- blue
--                             "", -- magenta
--                             "", -- cyan
--                             "", -- white
--                             "", -- bright black
--                             "", -- bright red
--                             "", -- bright green
--                             "", -- bright yellow
--                             "", -- bright blue
--                             "", -- bright magenta
--                             "", -- bright cyan
--                             "", -- bright white
--                             "", -- extended color 1
--                             "", -- extended color 2
--                         },
--                     },
--                 },
--             },
--             overrides = function(colors) -- add/modify highlights
--                 return {}
--             end,
--             theme = "wave", -- Load "wave" theme when 'background' option is not set
--             background = { -- map the value of 'background' option to a theme
--                 dark = "wave", -- try "dragon" !
--                 light = "lotus",
--             },
--         })

--         -- setup must be called before loading
--         vim.cmd("colorscheme kanagawa")
--     end,
-- }

return {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,

    config = function()
        require("catppuccin").setup({
            flavour = "auto", -- latte, frappe, macchiato, mocha
            background = { -- :h background
                light = "latte",
                dark = "mocha",
            },
            transparent_background = true, -- disables setting the background color.
            show_end_of_buffer = false, -- shows the '~' characters after the end of buffers
            term_colors = false, -- sets terminal colors (e.g. `g:terminal_color_0`)
            dim_inactive = {
                enabled = false, -- dims the background color of inactive window
                shade = "dark",
                percentage = 0.15, -- percentage of the shade to apply to the inactive window
            },
            no_italic = false, -- Force no italic
            no_bold = false, -- Force no bold
            no_underline = false, -- Force no underline
            styles = { -- Handles the styles of general hi groups (see `:h highlight-args`):
                comments = { "italic" }, -- Change the style of comments
                conditionals = { "italic" },
                loops = {},
                functions = {},
                keywords = {},
                strings = {},
                variables = {},
                numbers = {},
                booleans = {},
                properties = {},
                types = {},
                operators = {},
                -- miscs = {}, -- Uncomment to turn off hard-coded styles
            },
            color_overrides = {
                all = {
                    text = "#ffffff",
                },
                latte = {
                    base = "#ff0000",
                    mantle = "#242424",
                    crust = "#474747",
                },
                frappe = {},
                macchiato = {},
                mocha = {
                    base = "#000000",
                    mantle = "#FF0000",
                    crust = "#00FF00",
                },
            },
            custom_highlights = {},
            default_integrations = true,
            integrations = {
                cmp = true,
                gitsigns = true,
                nvimtree = true,
                treesitter = true,
                notify = false,
                mini = {
                    enabled = true,
                    indentscope_color = "",
                },
                -- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
            },
        })

        -- setup must be called before loading
        vim.cmd.colorscheme("catppuccin-mocha")
    end,
}
