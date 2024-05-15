return {
    "mini.comment",
    lazy = false,
    event = "BufReadPre",

    config = function()
        -- No need to copy this inside `setup()`. Will be used automatically.
        -- Options which control module behavior
        require("mini.comment").setup({
            opts = {
                -- Function to compute custom 'commentstring' (optional)
                custom_commentstring = nil,

                -- Whether to ignore blank lines
                ignore_blank_line = false,

                -- Whether to recognize as comment only lines without indent
                start_of_line = false,

                -- Whether to ensure single space pad for comment parts
                pad_comment_parts = true,
            },
            mappings = {
                -- Toggle comment (like `gcip` - comment inner paragraph) for both
                -- Normal and Visual modes
                -- comment = 'gc',
                comment = "",

                -- Toggle comment on current line
                -- comment_line = "gc",
                comment_line = "<c-r>",

                -- Toggle comment on visual selection
                -- comment_visual = "gc",
                comment_visual = "<c-r>",

                -- Define 'comment' textobject (like `dgc` - delete whole comment block)
                -- textobject = 'gc',
                textobject = "",
            },
        })
    end,
}
