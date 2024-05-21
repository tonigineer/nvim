return {
    "nvimdev/dashboard-nvim",
    event = "VimEnter",

    config = function()
        require("dashboard").setup({
            -- config
            theme = "hyper",
            hide = {
                statusline = false,
                tabline = false,
                winbar = false,
            },
            config = {
                week_header = {
                    enable = false,
                },
                header = {},
                center = {},
                shortcut = {
                    {
                        desc = " Health",
                        group = "DiagnosticError",
                        action = ":checkhealth",
                        key = "h",
                    },
                    {
                        desc = "󰊳 Lazy",
                        group = "DiagnosticWarn",
                        action = "Lazy update",
                        key = "u",
                    },
                    {
                        desc = " Mason",
                        group = "DiagnosticHint",
                        action = "Mason",
                        key = "m",
                    },
                    {
                        desc = " dotfiles",
                        group = "Files",
                        action = ":Neotree reveal ~/Dotfiles left",
                        key = "d",
                    },
                },
            },
        })
    end,
}
