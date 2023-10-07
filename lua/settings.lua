local options = vim.opt
local global = vim.g

-- [[ Checkhealth optionals ]]
global.loaded_perl_provider = 0
global.loaded_ruby_provider = 0
global.python3_host_prog = "/usr/bin/python"

-- [[ Context ]]
options.colorcolumn = ""
options.number = true
options.relativenumber = true
options.scrolloff = 8
options.signcolumn = "yes"

-- [[ Filetypes ]]
options.encoding = "utf8"

-- [[ Mouse ]]
-- options.mouse = ""

-- [[ Netrw ]]
-- NOTE: disables by other plugins
-- vim.cmd([[
--     nnoremap - :Explore<CR>
--     autocmd FileType netrw setl bufhidden=delete
-- ]])
-- global.netrw_banner = 0
-- global.netrw_liststyle = 3
-- global.netrw_bufsettings = "noma nomod nu nobl nowrap ro"

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
-- options.fillchars:append({ eob = "󰣇" }) -- 󰣙
options.fillchars:append({ eob = " " })

options.list = true
-- options.listchars:append "space:⋅"      -- ␣
-- options.listchars:append "eol:¬"        -- ↵
options.listchars:append("tab:⋅⋅")
options.listchars:append("trail:~")
options.listchars:append("extends:>")
options.listchars:append("precedes:<")