local lspconfig = require("lspconfig")
local cmp_nvim_lsp = require("cmp_nvim_lsp")

local opts = { noremap = true, silent = true }
local on_attach = function(_, bufnr)
    opts.buffer = bufnr
end

local capabilities = cmp_nvim_lsp.default_capabilities()

lspconfig["pyright"].setup({
    capabilities = capabilities,
    on_attach = on_attach,
})
