local options = vim.opt
local global = vim.g

global.mapleader = " "
global.maplocalleader = " "

-- [[ Checkhealth optionals]]
global.loaded_perl_provider = 0
global.loaded_ruby_provider = 0

-- [[ Context ]]
options.colorcolumn = ""
options.number = true
options.relativenumber = true
options.scrolloff = 8
options.signcolumn = "yes"

-- [[ Default: Explorer ]]
-- EXPLORER DISABELD BY PLUGINS!
vim.cmd([[
    nnoremap - :Explore<CR>
    autocmd FileType netrw setl bufhidden=delete
]])

global.netrw_banner = 0
global.netrw_liststyle = 3
global.netrw_bufsettings = "noma nomod nu nobl nowrap ro"

-- [[ Filetypes ]]
options.encoding = "utf8"

-- [[ Mouse ]]
-- options.mouse = ""

-- [[ Search ]]
options.ignorecase = true
options.smartcase = true
options.incsearch = true
options.hlsearch = false

-- [[ Splits ]]
options.splitright = false
options.splitbelow = false

-- [[ Swap files]]
options.swapfile = false

-- [[ Theme ]]
options.syntax = "ON"
options.termguicolors = true

-- [[ Whitespace ]]
-- https://stackoverflow.com/a/51995699
options.expandtab = true
options.shiftwidth = 4
options.softtabstop = 4
options.tabstop = 4
options.fillchars:append({ eob = "󰣇" }) -- 󰣙

options.list = true
-- options.listchars:append "space:⋅"      -- ␣
-- options.listchars:append "eol:¬"        -- ↵
options.listchars:append("tab:⋅⋅")
options.listchars:append("trail:~")
options.listchars:append("extends:>")
options.listchars:append("precedes:<")
