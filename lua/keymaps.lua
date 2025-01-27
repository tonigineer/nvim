-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local function apply_mappings(mappings)
    local wk_found, wk = pcall(require, "which-key")

    for mode, subset in pairs(mappings) do
        for keys, cfg in pairs(subset) do
            -- Add an actual key mapping
            if cfg.cmd then vim.keymap.set(mode, keys, cfg.cmd, cfg.opts) end

            -- Add a label to which key
            if wk_found then
                if string.find(keys, "<leader>") and cfg.desc then
                    wk.add({
                        keys,
                        cfg.desc,
                    })
                end
            end
        end
    end
end

local mappings = {}
for _, mode in ipairs({ "", "n", "v", "x", "s", "o", "!", "i", "l", "c", "t" }) do
    mappings[mode] = {}
end

local wk = require("which-key")
wk.add({ "<leader>l", group = "+LSP" })

local opts = {}

-- [[ Buffer ]]
opts = {
    nowait = true,
    silent = true,
}
mappings.n["<S-h>"] = {
    cmd = ":bp<cr>",
    opts = opts,
    desc = "Buffer previous",
}
mappings.n["<S-l>"] = {
    cmd = ":bn<cr>",
    opts = opts,
    desc = "Buffer next",
}

-- [[ Customs ]]
opts = {
    nowait = true,
    silent = true,
}
mappings.i["jk"] = {
    cmd = "<C-[>",
    opts = opts,
    desc = "Move lines up",
}
mappings.i["kj"] = {
    cmd = "<C-[>",
    opts = opts,
    desc = "Move lines up",
}

-- [[ Indent lines ]]
-- Stay in indent mode
opts = {
    silent = true,
}
mappings.n["<"] = {
    cmd = "<<",
    opts = opts,
    desc = "Indent to the left",
}
mappings.n[">"] = {
    cmd = ">>",
    opts = opts,
    desc = "Indent to the right",
}
mappings.v["<"] = {
    cmd = "<gv",
    opts = opts,
    desc = "Indent to the left",
}
mappings.v[">"] = {
    cmd = ">gv",
    opts = opts,
    desc = "Indent to the right",
}

-- [[ Move lines with K and J ]]
opts = {
    silent = true,
}
mappings.n["K"] = {
    cmd = ":move -2<CR>",
    opts = opts,
    desc = "Move line up",
}
mappings.n["J"] = {
    cmd = ":move +1<CR>",
    opts = opts,
    desc = "Move line down",
}
mappings.v["K"] = {
    cmd = ":move '<-2<CR>gv=gv",
    opts = opts,
    desc = "Move lines up",
}
mappings.v["J"] = {
    cmd = ":move '>+1<CR>gv=gv",
    opts = opts,
    desc = "Move lines down",
}

-- [[ Old habits ]]
opts = {
    silent = true,
}
mappings.n["<C-z>"] = {
    cmd = ":u<Return>",
    opts = opts,
    desc = "Undo changes",
}
mappings.v["<C-z>"] = {
    cmd = ":u<Return>",
    opts = opts,
    desc = "Undo changes",
}
mappings.i["<C-z>"] = {
    cmd = "<Esc>:u<Return>i",
    opts = opts,
    desc = "Undo changes",
}
mappings.n["<C-y>"] = {
    cmd = "<C-R><Return>",
    opts = opts,
    desc = "Redo changes",
}
mappings.v["<C-y>"] = {
    cmd = "<C-R><Return>",
    opts = opts,
    desc = "Redo changes",
}
mappings.i["<C-y>"] = {
    cmd = "<Esc><C-R><Return>i",
    opts = opts,
    desc = "Redo changes",
}
mappings.n["<C-s>"] = {
    cmd = ":w!<Return>",
    opts = opts,
    desc = "Save files",
}
mappings.v["<C-s>"] = {
    cmd = ":w!<Return>",
    opts = opts,
    desc = "Save files",
}
mappings.i["<C-s>"] = {
    cmd = "<Esc>:w!<Return>",
    opts = opts,
    desc = "Save files",
}
mappings.n["<C-a>"] = {
    cmd = "gg<S-v>G",
    opts = opts,
    desc = "Select all",
}
mappings.v["<C-a>"] = {
    cmd = "gg<S-v>G",
    opts = opts,
    desc = "Select all",
}

vim.api.nvim_set_keymap(
    "n",
    "<leader>F",
    ":lua require('conform').format({ bufnr = vim.api.nvim_get_current_buf() })<CR>",
    { noremap = true, silent = false, desc = "Format buffer with Conform" }
)

apply_mappings(mappings)
