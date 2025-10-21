return {
    "rose-pine/neovim",
    name = "rose-pine",
    config = function()
        require("rose-pine").setup({
            variant = "moon",
            dark_variant = "moon",
            dim_inactive_windows = false,
            extend_background_behind_borders = false,
            enable = { terminal = true },
            styles = { bold = false, italic = false, transparency = true },
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
                h0 = "iris",
                h1 = "foam",
                h2 = "rose",
                h3 = "gold",
                h4 = "pine",
                h5 = "foam",
            },
            -- feed persistent overrides where they make sense
            highlight_groups = {
                Comment = (P.comment and { fg = P.comment, italic = true })
                    or { fg = "subtle" },
                CursorLine = (P.line and { bg = P.line })
                    or { fg = "none", bg = "none" },
                Normal = (P.bg and { bg = P.bg }) or nil,
                NormalFloat = (P.bg and { bg = P.bg }) or nil,
            },
            before_highlight = function(group, hl, palette)
                if hl.undercurl then hl.undercurl = false end
            end,
        })
        -- vim.cmd("colorscheme rose-pine")
    end,
}
