local function apply_mappings(mappings)
    local wk_found, wk = pcall(require, "which-key")

    for mode, subset in pairs(mappings) do
        for keys, cfg in pairs(subset) do
            -- Add an actual key mapping
            if cfg.cmd then
                vim.keymap.set(mode, keys, cfg.cmd, cfg.opts)
            end

            -- Add a label to which key
            if wk_found then
                if string.find(keys, "<leader>") and cfg.desc then
                    wk.register({ [keys] = { cfg.desc } })
                end
            end
        end
    end
end

local mappings = {}
for _, mode in ipairs { "", "n", "v", "x", "s", "o", "!", "i", "l", "c", "t" } do
    mappings[mode] = {}
end

local opts               = {}

-- [[ Buffer ]]
mappings.n["<C-h>"]      = {
    cmd = "<cmd>bprev<CR>",
    opts = opts,
    desc = "Select previous buffer"
}
mappings.n["<C-l>"]      = {
    cmd = "<cmd>bnext<CR>",
    opts = opts,
    desc = "Select next buffer"
}

-- [[ Comments ]]
opts                     = { silent = true }
mappings.n["<leader>/"]  = {
    cmd = "<cmd>lua require('Comment.api').toggle.linewise.current()<CR>",
    opts = opts,
    desc = "󰆈 Comment line (toggle)"
}
mappings.v["<leader>/"]  = {
    cmd = "<esc><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>",
    opts = opts,
    desc = "󰆈 Comment line (toggle)"
}

-- [[ Customs ]]
opts                     = { nowait = true, silent = true }
mappings.i["jk"]         = { cmd = "<C-[>", opts = opts, desc = "Move lines up" }
mappings.i["kj"]         = { cmd = "<C-[>", opts = opts, desc = "Move lines up" }

-- [[ Diagnostics ]]
mappings.n["<leader>d"]  = { desc = " Diagnostic" }
mappings.n["<leader>db"] = { desc = "● Set breakpoint" }
mappings.n["<leader>dq"] = { desc = " Terminate debugging" }
mappings.n["<leader>dc"] = { desc = " Clear breakpoints" }
mappings.n["<leader>dn"] = { desc = " Step over" }
mappings.n["<leader>di"] = { desc = " Step into" }
mappings.n["<leader>do"] = { desc = " Step out" }
mappings.n["<leader>dp"] = { desc = " Pause" }
mappings.n["<leader>dh"] = { desc = "󰗧 Run to cursor" }
mappings.n["<leader>dr"] = { desc = " Run" }

-- [[ Goto preview ]]
opts                     = { noremap = true }
mappings.n["<leader>g"]  = { desc = " Goto preview" }
mappings.n["<leader>gp"] = {
    cmd = "<cmd>lua require('goto-preview').goto_preview_definition()<CR>",
    opts = opts,
    desc = "Preview Definition"
}

-- [[ Indent lines ]]
-- Stay in indent mode
opts                     = { silent = true }
mappings.v["<"]          = { cmd = "<gv", opts = opts, desc = "Indent to the left" }
mappings.v[">"]          = { cmd = ">gv", opts = opts, desc = "Indent to the right" }

-- [[ Leader ]]
-- INFO: forced by lazy to be set within lazy-vim.lua
-- global.mapleader = " "
-- global.maplocalleader = " "

-- [[ Move lines with K and J ]]
opts                     = { silent = true }
mappings.n["K"]          = { cmd = ":move -2<CR>", opts = opts, desc = "Move lines up" }
mappings.n["J"]          = { cmd = ":move +1<CR>", opts = opts, desc = "Move lines down" }
mappings.v["K"]          = { cmd = "move -2<CR>", opts = opts, desc = "Move lines up" }
mappings.v["J"]          = { cmd = ":move +1<CR>", opts = opts, desc = "Move lines down" }

-- [[ NvimTree ]]
opts                     = { silent = true }
mappings.n["<leader>e"]  = { cmd = "<cmd>NvimTreeToggle<cr>", opts = opts, desc = " NvimTree (toggle)" }

-- [[ Old habits ]]
opts                     = { silent = true }
mappings.n["<C-z>"]      = { cmd = ":u<Return>", opts = opts, desc = "Undo changes" }
mappings.v["<C-z>"]      = { cmd = ":u<Return>", opts = opts, desc = "Undo changes" }
mappings.i["<C-z>"]      = { cmd = "<Esc>:u<Return>i", opts = opts, desc = "Undo changes" }
mappings.n["<C-y>"]      = { cmd = "<C-R><Return>", opts = opts, desc = "Redo changes" }
mappings.v["<C-y>"]      = { cmd = "<C-R><Return>", opts = opts, desc = "Redo changes" }
mappings.i["<C-y>"]      = { cmd = "<Esc><C-R><Return>i", opts = opts, desc = "Redo changes" }
mappings.n["<C-s>"]      = { cmd = ":w!<Return>", opts = opts, desc = "Save files" }
mappings.v["<C-s>"]      = { cmd = ":w!<Return>", opts = opts, desc = "Save files" }
mappings.i["<C-s>"]      = { cmd = "<Esc>:w!<Return>", opts = opts, desc = "Save files" }
mappings.n["<C-a>"]      = { cmd = "gg<S-v>G", opts = opts, desc = "Select all" }
mappings.v["<C-a>"]      = { cmd = "gg<S-v>G", opts = opts, desc = "Select all" }

-- [[ Splits ]]
opts                     = { silent = true }
mappings.n["<leader>w"]  = { desc = " Splits" }
mappings.n["<leader>wh"] = { cmd = ":wincmd h<CR>", opts = {}, desc = "Move left" }
mappings.n["<leader>wj"] = { cmd = ":wincmd j<CR>", opts = {}, desc = "Move down" }
mappings.n["<leader>wk"] = { cmd = ":wincmd k<CR>", opts = {}, desc = "Move up" }
mappings.n["<leader>wl"] = { cmd = ":wincmd l<CR>", opts = {}, desc = "Move right" }
mappings.n["<leader>ws"] = { cmd = ":sp l<CR>", opts = {}, desc = "Split horizonal " }
mappings.n["<leader>wv"] = { cmd = ":vsp l<CR>", opts = {}, desc = "Split vertical " }

-- [[ Symbols outline ]]
mappings.n["<leader>o"]  = { cmd = ":SymbolsOutline<CR>", opts = {}, desc = "󱔁 Symbols outline (toggle)" }

-- [[ Telescope ]]
mappings.n["<leader>f"]  = { desc = " Telescope" }
mappings.n["<leader>ff"] = {
    cmd = ':lua require"telescope.builtin".find_files({ hidden = true })<CR>',
    opts = {},
    desc = "Find files"
}
mappings.n["<leader>fg"] = {
    cmd = ':lua require"telescope.builtin".live_grep()<CR>',
    opts = {},
    desc = "Grep text in files"
}
mappings.n["<leader>fo"] = { cmd = ':lua require"telescope.builtin".oldfiles()<CR>', opts = {}, desc = "Browse old files" }
mappings.n["<leader>fn"] = { cmd = ':lua require"startup".new_file()<CR>', opts = {}, desc = "Create new file" }

apply_mappings(mappings)
