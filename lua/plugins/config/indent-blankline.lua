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

require("ibl").setup { indent = { highlight = highlight } }

-- Set list characters
local options = vim.opt

options.list = true
-- options.listchars:append "space:⋅"      -- ␣
-- options.listchars:append "eol:¬"        -- ↵
-- options.listchars:append "tab:⋅⋅"
options.listchars:append "trail:~"
options.listchars:append "extends:>"
options.listchars:append "precedes:<"
