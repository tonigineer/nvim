return {
    {
        "echasnovski/mini.nvim",
        config = function()
            require("mini.ai").setup({ n_lines = 500 })
            require("mini.surround").setup()
        end,
    },

    {
        "echasnovski/mini.comment",
        lazy = false,
        event = "BufReadPre",
        opts = {
            options = {
                custom_commentstring = nil,
                ignore_blank_line = false,
                start_of_line = false,
                pad_comment_parts = true,
            },
            mappings = {
                comment = "<c-/>",
                comment_line = "<c-/>",
                comment_visual = "<c-/>",
                textobject = "<c-/>",
            },
        },
    },

    {
        "fladson/vim-kitty",
        ft = "kitty",
    },

    {
        "brenoprata10/nvim-highlight-colors",
        opts = {
            render = "background",
            virtual_symbol = "■",
            enable_named_colors = true,
            enable_tailwind = false,
            custom_colors = {
                { label = "%-%-theme%-primary%-color",   color = "#0f1219" },
                { label = "%-%-theme%-secondary%-color", color = "#5a5d64" },
            },
        },
    },

    {
        "machakann/vim-highlightedyank",
        event = "BufReadPre",
    },
}
