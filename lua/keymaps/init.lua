local function config(module)
    return require("keymaps." .. module)
end

config("bufferline")
config("custom")
config("dap")
config("floaterm")
config("lsp")
config("nvimtree")
config("oil")
config("oldhabits")
config("telescope")
