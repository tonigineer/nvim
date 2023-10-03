local options = { silent = true, noremap = true }
local function set(mode, lhs, rhs, opts)
    vim.keymap.set(mode, lhs, rhs, opts)
end

-- [[ Globals ]]
set("n", "<leader>q", ":q <CR>", options)

-- [[ Disables ]]
-- Delete and insert in normal mode conflicts with <leader>sl
-- when splitting within oil
set("n", "s", "<NOP>", options)
set("n", "<leader>d", "<NOP>", options)

-- [[ Move lines with K and J ]]
set("n", "K", ":move -2<CR>", options)
set("n", "J", ":move +1<CR>", options)
set("v", "K", ":move -2<CR>", options)
set("v", "J", ":move +1<CR>", options)

-- [[ Move between spilts ]]
set("n", "<leader>wj", ":wincmd j<CR>", options)
set("n", "<leader>wk", ":wincmd k<CR>", options)
set("n", "<leader>wh", ":wincmd h<CR>", options)
set("n", "<leader>wl", ":wincmd l<CR>", options)
set("n", "<leader>ws", ":sp l<CR>", options)
set("n", "<leader>wv", ":vsp l<CR>", options)
