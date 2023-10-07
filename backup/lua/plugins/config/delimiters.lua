vim.g.rainbow_delimiters = {
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

local function apply_colorscheme(colorscheme)
    for name, values in pairs(colorscheme) do
        vim.cmd([[:highlight RainbowDelimiter]]..name..[[ guifg=]]..values.color)
    end
end

apply_colorscheme(require("options.colors").currentColors)
