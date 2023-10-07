local function apply_mappings(mappings)
    for mode, subset in pairs(mappings) do
        for keys, cfg in pairs(subset) do
            vim.keymap.set(mode, keys, cfg.cmd, cfg.opts)
        end
    end
end

local mappings = {}
for _, mode in ipairs { "", "n", "v", "x", "s", "o", "!", "i", "l", "c", "t" } do
    mappings[mode] = {}
end

-- [[ Leader ]]
-- INFO: forced by lazy to be set within lazy-vim.lua
-- global.mapleader = " "
-- global.maplocalleader = " "

-- [[ Splits ]]
mappings.n["<C-h>"] = { cmd = "<C-w>h", opts = {}, desc = "Navigate to the left split" }
mappings.n["<C-j>"] = { cmd = "<C-w>j", opts = {}, desc = "Navigate to the bottom split" }
mappings.n["<C-k>"] = { cmd = "<C-w>k", opts = {}, desc = "Navigate to the top split" }
mappings.n["<C-l>"] = { cmd = "<C-w>l", opts = {}, desc = "Navigate to the right split" }

apply_mappings(mappings)




