local highlight = {
    "Red",
    "Yellow",
    "Blue",
    "Orange",
    "Green",
    "Violet",
    "Cyan",
}

local hooks = require "ibl.hooks"

local function set_color(color_name, color_code)
    vim.api.nvim_set_hl(0, color_name, { fg = color_code })
end

hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
    for k, v in pairs(require("options.colors").currentColors) do
        set_color(k, v.color)
    end
end)

-- Giving scope values avoid ugly yellow highlighting for scope
require("ibl").setup { indent = { highlight = highlight }, scope = { highlight = highlight }}
