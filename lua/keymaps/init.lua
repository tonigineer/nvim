local function config(module)
    return require("keymaps."..module)
end

config("custom")
config("dap")
config("lsp")
config("oil")
config("oldhabits")
config("telescope")
