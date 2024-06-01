return {
    "Bekaboo/dropbar.nvim",
    -- optional, but required for fuzzy finder support
    dependencies = {
        "nvim-telescope/telescope-fzf-native.nvim",
    },
    enabled = false,

    opts = {
        icons = {
            enable = true,
        },
        menu = {
            -- When on, preview the symbol under the cursor on CursorMoved
            preview = true,
            -- When on, automatically set the cursor to the closest previous/next
            -- clickable component in the direction of cursor movement on CursorMoved
            quick_navigation = true,
            entry = {
                padding = {
                    left = 1,
                    right = 1,
                },
            },
            -- Menu scrollbar options
            scrollbar = {
                enable = true,
                -- The background / gutter of the scrollbar
                -- When false, only the scrollbar thumb is shown.
                background = false,
            },
        },
    },
}
