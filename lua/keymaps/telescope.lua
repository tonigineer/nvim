local function set(lhs, rhs)
    vim.keymap.set("n", lhs, rhs, defaults)
end

local defaults = { silent = true, noremap = true }
local builtin = require("telescope.builtin")

set("<leader>ff", ':lua require"telescope.builtin".find_files({ hidden = true })<CR>')
set("<leader>fg", builtin.live_grep)
set("<leader>fb", builtin.buffers)
set("<leader>fh", builtin.help_tags)