local options = { silent = true, noremap = true }
local function set(mode, lhs, rhs, opts)
    vim.keymap.set(mode, lhs, rhs, opts)
end

set("n", "<leader>eo", ":SymbolsOutline<CR>", options)
