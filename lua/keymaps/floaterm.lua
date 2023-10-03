local options = { silent = true, noremap = true }
local function set(mode, lhs, rhs, opts)
    vim.keymap.set(mode, lhs, rhs, opts)
end

-- [[ Terminals ]]
set("n", "<leader>tn", ":FloatermNew<CR>", options)
set("t", "<leader>tn", "<C-\\><C-n>:FloatermNew<CR>", options)
set("n", "<leader>th", ":FloatermPrev<CR>", options)
set("t", "<leader>th", "<C-\\><C-n>:FploatermPrev<CR>", options)
set("n", "<leader>tl", ":FloatermNext<CR>", options)
set("t", "<leader>tl", "<C-\\><C-n>:FloatermNext<CR>", options)
set("n", "<leader>tt", ":FloatermToggle<CR>", options)
set("t", "<leader>tt", "<C-\\><C-n>:FloatermToggle<CR>", options)
set("t", "<leader>tq", "<C-\\><C-n>:FloatermKill<CR>", options)
