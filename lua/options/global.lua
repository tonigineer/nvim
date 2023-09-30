local options = vim.opt

options.swapfile = false

-- [[ Context ]]
options.colorcolumn = ""
options.number = true
options.relativenumber = true
options.scrolloff = 8
options.signcolumn = "yes"

-- [[ Filetypes ]]
options.encoding = "utf8"

-- [[ Search ]]
options.ignorecase = true
options.smartcase = true
options.incsearch = true
options.hlsearch = false

-- [[ Theme ]]
options.syntax = "ON"
options.termguicolors = true

-- [[ Whitespace ]]
-- https://stackoverflow.com/a/51995699
options.expandtab = true
options.shiftwidth = 4
options.softtabstop = 4
options.tabstop = 4
options.fillchars:append { eob = "󰣙" }
