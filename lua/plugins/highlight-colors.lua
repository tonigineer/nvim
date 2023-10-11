return {
    "brenoprata10/nvim-highlight-colors",
    event = "BufReadPre",

    config = function()
        require("nvim-highlight-colors").setup {
            render = "foreground", -- or 'foreground' or 'first_column'
            enabled_named_colors = true,
            enable_tailwind = true
        }
    end
}
