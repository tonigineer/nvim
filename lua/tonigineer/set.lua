-- vim.opt are automatically loaded before lazy.nvim startup
-- Default vim.opt that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/vim.opt.lua
-- Add any additional vim.opt here

-- ———— Colorscheme ————————————————————————————————————————————————————————————

-- vim.cmd.colorscheme("m3scheme")
-- Note: Remember to uncomment the workaround in ./init.lua when switching
vim.cmd.colorscheme("vague")
-- vim.cmd.colorscheme("rose-pine-moon")

-- ———— Providers (disable unused ones for faster :checkhealth) ————————————————

vim.g.loaded_node_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_ruby_provider = 0

-- ———— Context & Cursor ———————————————————————————————————————————————————————

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.signcolumn = "yes"
vim.opt.colorcolumn = ""
vim.opt.scrolloff = 8          -- Min lines to keep above/below cursor
vim.opt.sidescrolloff = 8      -- Min columns to keep left/right of cursor when wrap is off
vim.opt.laststatus = 3         -- Global statusline
vim.opt.ruler = true           -- Show cursor position
vim.opt.showmode = false       -- Don't show -- INSERT -- etc.
vim.opt.showcmd = false        -- Hide partial command in last line

-- Highlight current line number
vim.api.nvim_set_hl(0, "CursorLineNr", { link = "DiagnosticWarn", bold = true })

-- ———— Timing —————————————————————————————————————————————————————————————————

vim.opt.updatetime = 300       -- Faster swap write & CursorHold trigger
vim.opt.timeoutlen = 200       -- Time to wait for mapped sequence (ms)

-- ———— Wrapping & Movement ————————————————————————————————————————————————————

vim.opt.whichwrap:append("<,>,[,],h,l") -- Keys allowed to cross line boundaries
vim.opt.linebreak = true

-- ———— Filetypes & Encoding ———————————————————————————————————————————————————

vim.opt.encoding = "utf8"
vim.opt.confirm = true         -- Ask to save on quit with unsaved changes

-- ———— Interpreter & Shell ————————————————————————————————————————————————————

vim.g.python3_host_prog = "/usr/bin/python"
vim.opt.shell = "/usr/bin/zsh"

-- -- If the current system shell or the `shell` option is set to /usr/bin/fish
-- -- then revert to sh, else default to the current system shell.
-- if os.getenv('SHELL') == "/usr/bin/fish" or vim.opt.shell == "/usr/bin/fish" then
--     vim.opt.shell = "/usr/bin/fish"
-- else
--    vim.opt.shell = os.getenv('SHELL')
-- end

-- ———— Mouse & Clipboard ——————————————————————————————————————————————————————

vim.opt.mouse = "a"
vim.opt.clipboard:append("unnamedplus")

-- ———— Search —————————————————————————————————————————————————————————————————

vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.incsearch = true
vim.opt.hlsearch = false

-- ———— Window Splits ——————————————————————————————————————————————————————————

vim.opt.splitright = true      -- Horizontal splits go right
vim.opt.splitbelow = true      -- Vertical splits go below

-- ———— Backup & Undo ——————————————————————————————————————————————————————————

vim.opt.swapfile = false
vim.opt.writebackup = false
vim.opt.undofile = true        -- Persistent undo

-- ———— Appearance & Theme —————————————————————————————————————————————————————

vim.g.have_nerd_font = true
vim.opt.syntax = "ON"
vim.opt.termguicolors = true
vim.opt.guifont = "monospace:h17"

-- ———— Whitespace & Indentation ———————————————————————————————————————————————

vim.opt.expandtab = true       -- Use spaces instead of tabs
vim.opt.shiftwidth = 4         -- Indent width
vim.opt.softtabstop = 4
vim.opt.tabstop = 4            -- Visual tab width
vim.opt.iskeyword:append("-")  -- Treat words with `-` as single words

-- ———— Listchars (visible whitespace) —————————————————————————————————————————

vim.opt.list = true
vim.opt.listchars:append("space:‧")
vim.opt.listchars:append("tab:→ ")
vim.opt.listchars:append("trail:~")
vim.opt.listchars:append("extends:>")
vim.opt.listchars:append("precedes:<")
-- vim.opt.listchars:append("eol:¬")
-- vim.opt.listchars:append("eol:↴")

-- ———— UI Helpers —————————————————————————————————————————————————————————————

vim.opt.pumheight = 10         -- Popup menu max height
vim.opt.fillchars:append({ eob = " " }) -- Remove `~` from empty lines
vim.opt.shortmess:append("c")  -- Hide completion messages
vim.opt.formatoptions:remove({ "c", "r", "o" }) -- Disable auto comment continuation
