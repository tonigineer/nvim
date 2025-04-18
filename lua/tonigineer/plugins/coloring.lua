return {
    "rose-pine/neovim",
    config = function()
        require("rose-pine").setup({
            variant = "moon", -- auto, main, moon, or dawn
            dark_variant = "moon", -- main, moon, or dawn
            dim_inactive_windows = false,
            extend_background_behind_borders = false,

            enable = {
                terminal = true,
                -- legacy_highlights = true, -- Improve compatibility for previous versions of Neovim
                -- migrations = true, -- Handle deprecated options automatically
            },

            styles = {
                bold = false,
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

            -- https://rosepinetheme.com/palette/
            highlight_groups = {
                Comment = { fg = "subtle" },
                String = { fg = "#FFFFFF", italic = true },
                -- VertSplit = { fg = "muted", bg = "muted" },
                -- Normal = { bg = "none" },
                CursorLine = { fg = "none", bg = "none" },
                -- Tags = { fg = "love" },
                -- Keyword = { fg = "love" },
                -- Delimiter = { fg = "iris" },
                -- SpecialChar = { fg = "foam" },
                -- PunctDelimiter = { fg = "gold" },
                -- Identifier = { fg = "iris" },
                -- Function = { fg = "foam" },
                -- Statement = { fg = "pine" },
                -- Type = { fg = "iris" },
            },

            before_highlight = function(group, highlight, palette)
                -- Disable all undercurls
                if highlight.undercurl then highlight.undercurl = false end
                --
                -- Change palette colour
                if highlight.fg == palette.pine then
                    highlight.fg = palette.pine
                    -- highlight.bg = palette.pine
                end
            end,
        })

        vim.cmd("colorscheme rose-pine")
    end,
}
