return {
    {
        "echasnovski/mini.indentscope",
        version = false, -- wait till new 0.7.0 release to put it back on semver
        event = "VeryLazy",
        opts = {
            -- symbol = "▏",
            -- symbol = "│",
            symbol = "",
            -- symbol = "╎",
            options = {
                try_as_border = true,
                indent_at_cursor = false,
                border = "both",
            },
            draw = {
                delay = 10,
                animation = function() return 0 end,
            },
        },
    },
}
