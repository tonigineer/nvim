local builtin = require("telescope.builtin")
local defaults = { silent = true, noremap = true }
local function set(lhs, rhs)
    vim.keymap.set("n", lhs, rhs, defaults)
end

local themes = {
    cursor = require("telescope.themes").get_cursor({}),
    dropdown = require("telescope.themes").get_dropdown({}),
    ivy = require("telescope.themes").get_ivy({})
}

set("<leader>D", function() builtin.diagnostics(themes.ivy) end)
set("<leader>ga", function() vim.lsp.buf.code_action() end)
set("<leader>gr", function() vim.lsp.buf.rename() end)
set("<leader>gh", function() vim.lsp.buf.hover() end)
set("<leader>gd", function() builtin.lsp_definitions(themes.cursor) end)
set("<leader>gi", function() builtin.lsp_implementations(themes.cursor) end)
set("<leader>gt", function() builtin.lsp_type_definitions(themes.cursor) end)
set("<leader>gs", function() builtin.lsp_workspace_symbols(themes.dropdown) end)
