local function config(module)
    return require("plugins.config."..module)
end

config("autopairs")
config("completion")
config("delimiters")
config("dressing")
config("highlight-colors")
config("general")
config("indent-blankline")
config("illuminate")
config("linting")
config("lualine")
config("noice")
config("notify")
config("oil")
config("startup")
config("telescope")
config("treesitter")

config("lsp")
config("dap")