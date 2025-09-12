return {
    "https://github.com/vague2k/vague.nvim",
    config = function()
        require("vague").setup({
            transparent = true, -- don't set background
            -- disable bold/italic globally in `style`
            bold = true,
            italic = true,
            style = {
                -- "none" is the same thing as default. But "italic" and "bold" are also valid options
                boolean = "bold",
                number = "none",
                float = "none",
                error = "bold",
                comments = "italic",
                conditionals = "none",
                functions = "none",
                headings = "bold",
                operators = "none",
                strings = "italic",
                variables = "none",

                -- keywords
                keywords = "none",
                keyword_return = "italic",
                keywords_loop = "none",
                keywords_label = "none",
                keywords_exception = "none",

                -- builtin
                builtin_constants = "bold",
                builtin_functions = "none",
                builtin_types = "bold",
                builtin_variables = "none",
            },
            -- plugin styles where applicable
            -- make an issue/pr if you'd like to see more styling options!
            plugins = {
                cmp = {
                    match = "bold",
                    match_fuzzy = "bold",
                },
                dashboard = {
                    footer = "italic",
                },
                lsp = {
                    diagnostic_error = "bold",
                    diagnostic_hint = "none",
                    diagnostic_info = "italic",
                    diagnostic_ok = "none",
                    diagnostic_warn = "bold",
                },
                neotest = {
                    focused = "bold",
                    adapter_name = "bold",
                },
                telescope = {
                    match = "bold",
                },
            },

            -- Override highlights or add new highlights
            on_highlights = function(highlights, colors) end,

            -- Override colors
            colors = {
                bg = "#141415",
                fg = "#cdcdcd",
                floatBorder = "#878787",
                -- line = "#252530",
                line = "#141415",
                comment = "#606079",
                builtin = "#b4d4cf",
                func = "#c48282",
                string = "#e8b589",
                number = "#e0a363",
                property = "#c3c3d5",
                constant = "#aeaed1",
                parameter = "#bb9dbd",
                visual = "#333738",
                error = "#d8647e",
                warning = "#f3be7c",
                hint = "#7e98e8",
                operator = "#90a0b5",
                keyword = "#6e94b2",
                type = "#9bb4bc",
                search = "#405065",
                plus = "#7fa563",
                delta = "#f3be7c",
            },
        })

        vim.cmd("colorscheme vague")
    end,
}

-- return {
--     "rose-pine/neovim",
--     config = function()
--         require("rose-pine").setup({
--             variant = "moon", -- auto, main, moon, or dawn
--             dark_variant = "moon", -- main, moon, or dawn
--             dim_inactive_windows = false,
--             extend_background_behind_borders = false,
--
--             enable = {
--                 terminal = true,
--                 -- legacy_highlights = true, -- Improve compatibility for previous versions of Neovim
--                 -- migrations = true, -- Handle deprecated options automatically
--             },
--
--             styles = {
--                 bold = false,
--                 italic = false,
--                 transparency = true,
--             },
--
--             groups = {
--                 border = "muted",
--                 link = "iris",
--                 panel = "surface",
--
--                 error = "love",
--                 hint = "iris",
--                 info = "foam",
--                 note = "pine",
--                 todo = "rose",
--                 warn = "gold",
--
--                 git_add = "foam",
--                 git_change = "rose",
--                 git_delete = "love",
--                 git_dirty = "rose",
--                 git_ignore = "muted",
--                 git_merge = "iris",
--                 git_rename = "pine",
--                 git_stage = "iris",
--                 git_text = "rose",
--                 git_untracked = "subtle",
--
--                 h1 = "iris",
--                 h2 = "foam",
--                 h3 = "rose",
--                 h4 = "gold",
--                 h5 = "pine",
--                 h6 = "foam",
--             },
--
--             -- https://rosepinetheme.com/palette/
--             highlight_groups = {
--                 Comment = { fg = "subtle" },
--                 String = { fg = "#FFFFFF", italic = true },
--                 -- VertSplit = { fg = "muted", bg = "muted" },
--                 -- Normal = { bg = "none" },
--                 CursorLine = { fg = "none", bg = "none" },
--                 -- Tags = { fg = "love" },
--                 -- Keyword = { fg = "love" },
--                 -- Delimiter = { fg = "iris" },
--                 -- SpecialChar = { fg = "foam" },
--                 -- PunctDelimiter = { fg = "gold" },
--                 -- Identifier = { fg = "iris" },
--                 -- Function = { fg = "foam" },
--                 -- Statement = { fg = "pine" },
--                 -- Type = { fg = "iris" },
--             },
--
--             before_highlight = function(group, highlight, palette)
--                 -- Disable all undercurls
--                 if highlight.undercurl then highlight.undercurl = false end
--                 --
--                 -- Change palette colour
--                 if highlight.fg == palette.pine then
--                     highlight.fg = palette.pine
--                     -- highlight.bg = palette.pine
--                 end
--             end,
--         })
--
--         vim.cmd("colorscheme rose-pine")
--     end,
-- }
