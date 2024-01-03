return {
    "nvim-lualine/lualine.nvim",
    lazy = false,
    event = "VimEnter",

    config = function()
        require("lualine").setup({
            options = {
                theme = "catppuccin"
            }
        })
    end
}
