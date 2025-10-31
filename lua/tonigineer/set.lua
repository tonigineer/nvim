-- vim.opt are automatically loaded before lazy.nvim startup
-- Default vim.opt that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/vim.opt.lua
-- Add any additional vim.opt here

-- [[ Colorscheme ]]
vim.cmd.colorscheme("m3scheme")

-- Note: Remember to uncomment to workaround in ./init.lua
-- vim.cmd.colorscheme("vague")
-- vim.cmd.colorscheme("rose-pine-moon")

-- [[ Checkhealth ]]
vim.g.loaded_node_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_ruby_provider = 0

-- [[ Context ]]
vim.opt.colorcolumn = ""
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.scrolloff = 8 -- minimal number of screen lines to keep above and below the cursor
vim.opt.sidescrolloff = 8 -- minimal number of screen columns to keep to the left and right of the cursor if wrap is `false`
vim.opt.signcolumn = "yes"
vim.opt.pumheight = 10 -- pop up menu height
vim.opt.showmode = false -- see things like -- INSERT -- anymore
vim.opt.updatetime = 300 -- faster completion (4000ms default)
vim.opt.timeoutlen = 200 -- time to wait for a mapped sequence to complete (in milliseconds)
vim.opt.whichwrap:append("<,>,[,],h,l") -- keys allowed to move to the previous/next line when the beginning/end of line is reached

-- [[ Filetypes ]]
vim.opt.encoding = "utf8"
-- if performing an operation that would fail due to unsaved changes in the buffer (like `:q`),
-- instead raise a dialog asking if you wish to save the current file(s)
-- See `:help 'confirm'`
vim.opt.confirm = true

-- [[ Interpreter ]]
vim.g.python3_host_prog = "/usr/bin/python"

-- -- If the current system shell or the `shell` option is set to /usr/bin/fish then revert to sh
-- if os.getenv('SHELL') == "/usr/bin/fish" or vim.opt.shell == "/usr/bin/fish" then
--     vim.opt.shell = "/usr/bin/fish"
-- else
--    -- Else default to the system current shell.
--    vim.opt.shell = os.getenv('SHELL')
-- end
vim.opt.shell = "/usr/bin/zsh"

-- [[ Mouse ]]
vim.opt.mouse = "a"
vim.opt.clipboard:append("unnamedplus")

-- [[ Search ]]
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.incsearch = true
vim.opt.hlsearch = false

-- [[ Splits ]]
vim.opt.splitright = true -- force all horizontal splits to go below current window
vim.opt.splitbelow = true -- force all vertical splits to go to the right of current window

-- [[ Swap files]]
vim.opt.swapfile = false
vim.opt.undofile = true -- enable persistent undo
vim.opt.writebackup = false -- if a file is being edited by another program (or was written to file while editing with another program), it

-- [[ Theme ]]
vim.g.have_nerd_font = true
vim.opt.syntax = "ON"
vim.opt.termguicolors = true
vim.opt.cursorline = true -- highlight the current line
vim.api.nvim_set_hl(0, "CursorLineNr", { link = "DiagnosticWarn", bold = true })
vim.opt.laststatus = 3 -- only the last window will always have a status line
vim.opt.showcmd = false -- hide (partial) command in the last line of the screen (for performance)
vim.opt.ruler = true -- hide the line and column number of the cursor position
vim.opt.guifont = "monospace:h17" -- the font used in graphical neovim applications

-- [[ Whitespace ]]
-- https://stackoverflow.com/a/51995699
vim.opt.expandtab = true -- convert tabs to spaces
vim.opt.shiftwidth = 4 -- the number of spaces inserted for each indentation
vim.opt.softtabstop = 4
vim.opt.tabstop = 4 -- insert 2 spaces for a tab
vim.opt.fillchars:append({ eob = " " }) -- Remove `~` from empty lines

vim.opt.list = true
vim.opt.linebreak = true
-- vim.opt.listchars:append("space:·") -- ␣
vim.opt.listchars:append("space:‧") -- ␣
-- vim.opt.listchars:append("eol:¬") -- ↵
-- vim.opt.listchars:append("eol:↴") -- ↵

vim.opt.listchars:append("tab:→ ") -- →␣
vim.opt.listchars:append("trail:~")
vim.opt.listchars:append("extends:>")
vim.opt.listchars:append("precedes:<")
vim.opt.iskeyword:append("-") -- treats words with `-` as single words
vim.opt.shortmess:append("c") -- hide all the completion messages, e.g. "-- XXX completion (YYY)", "match 1 of 2", "The only match", "Pattern not found"
vim.opt.formatoptions:remove({ "c", "r", "o" }) -- This is a sequence of letters which describes how automatic formatting is to be done

vim.opt.fillchars:append({ eob = " " }) -- remove ~ from empty lines

vim.opt.list = true
vim.opt.linebreak = true
