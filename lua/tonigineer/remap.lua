-- set in lazy.lua
-- vim.g.mapleader = " "

-- source current file
-- vim.keymap.set("n", "<leader>", function()
--    vim.cmd("so")
-- end)

-- vim.keymap.set("n", "<leader>pv", vim.cmd.Ex, { desc = "Open netrw" })

-- vim.keymap.set("x", "<leader>p", [["_dP]], { desc = "Paste without register"})

-- yank to system clipboard instead of default register
-- vim.keymap.set({"n", "v"}, "<leader>y", [["+y]], { desc = "Yank without register"})
-- vim.keymap.set("n", "<leader>Y", [["+Y]], { desc = "Yank line without register"})

-- delete without copying to default register
-- vim.keymap.set({"n", "v"}, "<leader>d", "\"_d", { desc="Delete without register"})

vim.keymap.set({ "n", "v" }, "<C-s>", ":w!<Return>", { desc = "Save buffer" })
vim.keymap.set({ "i" }, "<C-s>", "<ESC>:w!<Return>", { desc = "Save buffer" })

vim.keymap.set({ "i" }, "jk", "<C-[>", { desc = "Quit insert mode" })
vim.keymap.set({ "i" }, "kj", "<C-[>", { desc = "Quit insert mode" })

vim.keymap.set({ "n", "v" }, "<C-a>", "gg<S-v>G", { desc = "Select all" })

vim.keymap.set({ "i" }, "<C-z>", "<Esc>:u<Return>i", { desc = "Undo" })
vim.keymap.set({ "n", "v" }, "<C-z>", ":u<Return>", { desc = "Undo" })

vim.keymap.set({ "i" }, "<C-y>", "<Esc><C-r>i", { desc = "Redo" })
vim.keymap.set({ "n", "v" }, "<C-y>", "<C-r>", { desc = "Redo" })

vim.keymap.set({ "n" }, "<", "<<", { desc = "Indent left" })
vim.keymap.set({ "v" }, "<", "<gv", { desc = "Indent left" })
vim.keymap.set({ "v" }, ">", ">gv", { desc = "Indent right" })
vim.keymap.set({ "n" }, ">", ">>", { desc = "Indent right" })

vim.keymap.set({ "n" }, "K", ":move -2<CR>", { desc = "Move lines up" })
vim.keymap.set({ "n" }, "J", ":move +1<CR>", { desc = "Move lines down" })

vim.keymap.set({ "v" }, "K", ":move '<-2<CR>gv=gv", { desc = "Move lines up" })
vim.keymap.set(
    { "v" },
    "J",
    ":move '>+1<CR>gv=gv",
    { desc = "Move lines down" }
)
