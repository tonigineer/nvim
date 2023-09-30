local function config(module)
    return require("keymaps."..module)
end

config("custom")
config("oil")
config("oldhabits")
config("telescope")
