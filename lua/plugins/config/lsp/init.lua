local function lsp(name)
    return require("plugins.config.lsp." .. name)
end

lsp("mason")
lsp("formatting")

lsp("clang")
lsp("lua")
lsp("python")
lsp("rust")

-- Change the Diagnostic symbols in the sign column (gutter)
local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

