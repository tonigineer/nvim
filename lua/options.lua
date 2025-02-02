-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

local options = vim.opt
local global = vim.g

-- [[ Checkhealth ]]
global.loaded_node_provider = 0
global.loaded_perl_provider = 0
global.loaded_ruby_provider = 0

-- [[ Context ]]
options.colorcolumn = ""
options.number = true
options.relativenumber = true
options.scrolloff = 8 -- minimal number of screen lines to keep above and below the cursor
options.sidescrolloff = 8 -- minimal number of screen columns to keep to the left and right of the cursor if wrap is `false`
options.signcolumn = "yes"
vim.opt.pumheight = 10 -- pop up menu height
vim.opt.showmode = false -- see things like -- INSERT -- anymore
options.updatetime = 300 -- faster completion (4000ms default)
options.timeoutlen = 200 -- time to wait for a mapped sequence to complete (in milliseconds)
options.whichwrap:append("<,>,[,],h,l") -- keys allowed to move to the previous/next line when the beginning/end of line is reached

-- [[ Filetypes ]]
options.encoding = "utf8"

-- [[ Interpreter ]]
global.python3_host_prog = "/usr/bin/python"

-- -- If the current system shell or the `shell` option is set to /usr/bin/fish then revert to sh
-- if os.getenv('SHELL') == "/usr/bin/fish" or vim.opt.shell == "/usr/bin/fish" then
--     vim.opt.shell = "/usr/bin/fish"
-- else
--    -- Else default to the system current shell.
--    vim.opt.shell = os.getenv('SHELL')
-- end
vim.opt.shell = "/usr/bin/zsh"

-- [[ Mouse ]]
options.mouse = "a"
options.clipboard:append("unnamedplus")

-- [[ Search ]]
options.ignorecase = true
options.smartcase = true
options.incsearch = true
options.hlsearch = false

-- [[ Splits ]]
options.splitright = true -- force all horizontal splits to go below current window
options.splitbelow = true -- force all vertical splits to go to the right of current window

-- [[ Swap files]]
options.swapfile = false
options.undofile = true -- enable persistent undo
options.writebackup = false -- if a file is being edited by another program (or was written to file while editing with another program), it

-- [[ Theme ]]
options.syntax = "ON"
options.termguicolors = true
options.cursorline = false -- highlight the current line
options.laststatus = 3 -- only the last window will always have a status line
options.showcmd = false -- hide (partial) command in the last line of the screen (for performance)
options.ruler = true -- hide the line and column number of the cursor position
options.guifont = "monospace:h17" -- the font used in graphical neovim applications

-- [[ Whitespace ]]
-- https://stackoverflow.com/a/51995699
options.expandtab = true -- convert tabs to spaces
options.shiftwidth = 4 -- the number of spaces inserted for each indentation
options.softtabstop = 4
options.tabstop = 4 -- insert 2 spaces for a tab
-- options.fillchars:append({ eob = " " })

options.list = true
options.linebreak = true
-- options.listchars:append("space:⋅") -- ␣
options.listchars:append("eol:¬") -- ↵
-- options.listchars:append("tab:⋅⋅")
options.listchars:append("trail:~")
options.listchars:append("extends:>")
options.listchars:append("precedes:<")
options.iskeyword:append("-") -- treats words with `-` as single words
options.shortmess:append("c") -- hide all the completion messages, e.g. "-- XXX completion (YYY)", "match 1 of 2", "The only match", "Pattern not found"
options.formatoptions:remove({ "c", "r", "o" }) -- This is a sequence of letters which describes how automatic formatting is to be done
