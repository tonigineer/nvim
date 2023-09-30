local function config(module)
    return require("plugins.config."..module)
end

config("autopairs")
config("dressing")
config("general")
config("highlight-colors")
config("indent-blankline")
config("illuminate")
config("lualine")
config("oil")
config("telescope")
config("treesitter")
