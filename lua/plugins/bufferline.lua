return {
    "akinsho/bufferline.nvim",
    version = "*",
    dependencies = "nvim-tree/nvim-web-devicons",
    enabled = true,

    config = function()
        local palette = require("rose-pine.palette")
        require("bufferline").setup({
            options = {
                separator_style = "none", -- Options: "slant", "thick", "thin", "none"
                -- Other options:
                show_buffer_close_icons = false, -- Hide buffer close icons
                show_close_icon = false, -- Hide main close icon
                enforce_regular_tabs = true, -- Make tabs uniform in size
            },
            highlights = {
                background = {
                    fg = palette.subtle,
                    bg = "#121212",
                },
                buffer_selected = {
                    fg = palette.love,
                    bg = "#121212",
                    bold = false,
                    italic = false,
                },
                fill = {
                    bg = "#121212",
                },
                separator = {
                    fg = "#121212", -- Match the background color to hide separators
                    bg = "#121212",
                },
                separator_selected = {
                    fg = "#121212", -- Match the background for selected tab
                    bg = "#121212", -- Match selected tab background
                },
                separator_visible = {
                    fg = "#121212", -- Match the background for visible but unselected tab
                    bg = "#121212",
                },
            },
        })
    end,
}
