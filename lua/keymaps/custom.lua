local options = { silent = true, noremap = true }
local function set(mode, lhs, rhs, options)
    vim.keymap.set(mode, lhs, rhs, options)
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
set("n", "<leader>j", ":wincmd j<CR>", options)
set("n", "<leader>k", ":wincmd k<CR>", options)
set("n", "<leader>h", ":wincmd h<CR>", options)
set("n", "<leader>l", ":wincmd l<CR>", options)

-- [[ Debugging ]]
set("n", "<leader>dt", ':DapToggleBreakpoint<CR>', options)
set("n", "<leader>dx", ':DapTerminate<CR>', options)
set("n", "<leader>dr", ':DapContinue<CR>', options)
