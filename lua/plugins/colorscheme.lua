local M = {
  "folke/tokyonight.nvim",
  lazy = false,    -- make sure we load this during startup if it is your main colorscheme
  priority = 1000, -- make sure to load this before all the other start plugins
}

function M.config()
  require("tokyonight").setup({
    -- your configuration comes here
    -- or leave it empty to use the default settings
    style = "moon",        -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
    light_style = "day",    -- The theme is used when the background is set to light
    transparent = true,     -- Enable this to disable setting the background color
    terminal_colors = true, -- Configure the colors used when opening a `:terminal` in [Neovim](https://github.com/neovim/neovim)
    styles = {
        -- Style to be applied to different syntax groups
        -- Value is any valid attr-list value for `:help nvim_set_hl`
        comments = { italic = true },
        keywords = { italic = false },
        functions = {},
        variables = {},
        -- Background styles. Can be "dark", "transparent" or "normal"
        sidebars = "transparent",            -- style for sidebars, see below
        floats = "transparent",              -- style for floating windows
    },
    sidebars = { "qf", "help" },      -- Set a darker background on sidebar-like windows. For example: `["qf", "vista_kind", "terminal", "packer"]`
    day_brightness = 0.3,             -- Adjusts the brightness of the colors of the **Day** style. Number between 0 and 1, from dull to vibrant colors
    hide_inactive_statusline = false, -- Enabling this option, will hide inactive statuslines and replace them with a thin border instead. Should work with the standard **StatusLine** and **LuaLine**.
    dim_inactive = true,             -- dims inactive windows
    lualine_bold = false,             -- When `true`, section headers in the lualine theme will be bold
})


vim.cmd("colorscheme tokyonight")
end

-- M.colors = {
--     fg = "#111111",
--     bg = "#111111",
--     okay = "#111111",
--     error = "#111111",
--     warning = "#111111",
--     info = "#111111",
--     note = "#111111",
--     red = "#eb6f92",
--     yellow = "#f6c177" ,
--     blue = "#9ccfd8" ,
--     orange = "#ebbcba",
--     green = "#56bf9f",
--     violet = "#c4a7e7",
--     cyan = "#3e8fb0",

-- }

-- M.highlights = {M.colors.red, M.colors.yellow}

return M
