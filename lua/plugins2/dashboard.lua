return {
    "nvimdev/dashboard-nvim",
    event = "VimEnter",

    config = function()
        require("dashboard").setup({
            -- config
            theme = "hyper",
            hide = {
                statusline = false, -- hide statusline default is true
                tabline = false, -- hide the tabline
                winbar = false, -- hide winbar
            },
            config = {
                week_header = {
                    enable = true,
                },
                shortcut = {
                    {
                        desc = "󰊳 Update",
                        group = "@property",
                        action = "Lazy update",
                        key = "u",
                    },
                    {
                        desc = " Health",
                        group = "Number",
                        action = ":checkhealth",
                        key = "h",
                    },
                    {
                        icon = " ",
                        icon_hl = "@variable",
                        desc = "Files",
                        group = "Label",
                        action = "Telescope find_files",
                        key = "f",
                    },
                    {
                        desc = " Mason",
                        group = "DiagnosticHint",
                        action = "Mason",
                        key = "m",
                    },
                    {
                        desc = " dotfiles",
                        group = "Number",
                        action = ":Neotree reveal ~/.dotfiles left",
                        key = "d",
                    },
                },
            },
        })
    end,
}
