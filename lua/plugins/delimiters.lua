return {
    "HiPhish/rainbow-delimiters.nvim",
    event = "BufReadPre",

    config = function()
        vim.g.rainbow_delimiters = {
            -- coloring from bottom to top color!
            highlight = {
                'RainbowDelimiterCyan',
                'RainbowDelimiterViolet',
                'RainbowDelimiterGreen',
                'RainbowDelimiterOrange',
                'RainbowDelimiterBlue',
                'RainbowDelimiterYellow',
                'RainbowDelimiterRed'
            }
        }

        local function apply_colorscheme(color_table)
            for name, value in pairs(color_table) do
                vim.cmd([[:highlight RainbowDelimiter]] .. name .. [[ guifg=]] .. value)
            end
        end

        apply_colorscheme(require("vanity").colors.highlighting.delimiters)
    end
}
