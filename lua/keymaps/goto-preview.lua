local function set(mode, lhs, rhs, options)
    vim.keymap.set(mode, lhs, rhs, options)
end

set("n", "<leader>gp", "<cmd>lua require('goto-preview').goto_preview_definition()<CR>", { noremap = true })
