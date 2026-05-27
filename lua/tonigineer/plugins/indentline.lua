return {
    {
        "echasnovski/mini.indentscope",
        version = false,
        event = "VeryLazy",
        opts = {
            symbol = "",
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
