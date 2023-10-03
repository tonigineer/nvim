local options = { silent = true, noremap = true }
local function set(mode, lhs, rhs, opts)
    vim.keymap.set(mode, lhs, rhs, opts)
end

set("n", "<leader>bl", ":bnext<CR>", options)
set("n", "<leader>bh", ":bprev<CR>", options)
set("n", "<leader>bq", ":bw<CR>", options)
