local function lsp(name)
    return require("plugins.config.lsp."..name)
end

lsp("mason")
lsp("general")
lsp("clang")
lsp("rust")
