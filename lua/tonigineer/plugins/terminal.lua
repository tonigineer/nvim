return {
    "akinsho/toggleterm.nvim",
    event = "VeryLazy",
    config = function()
        local toggleterm = require("toggleterm")

        toggleterm.setup({
            size = 10,
            open_mapping = [[<c-\>]],
            hide_numbers = true,
            shade_terminals = true,
            shading_factor = 2,
            start_in_insert = true,
            insert_mappings = true,
            persist_size = true,
            direction = "horizontal",
            close_on_exit = true,
            shell = vim.o.shell,
            float_opts = {
                width = 75,
                height = 15,
                border = "curved",
            },
            highlights = {
                Normal = {
                    guibg = "#16161e",
                },
                NormalFloat = {
                    link = "Normal",
                    guibg = "#16161e",
                },
                FloatBorder = {
                    guifg = "#ff6767",
                    guibg = "",
                },
            },
        })
    end,
}
