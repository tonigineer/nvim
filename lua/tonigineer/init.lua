require("tonigineer.lazy")
require("tonigineer.remap")
require("tonigineer.set")
require("tonigineer.autocmds")

-- Workaround: Otherwise the m3scheme in light mode
-- is not displayed correctly.
vim.api.nvim_create_autocmd("User", {
    pattern = "VeryLazy",
    once = true,
    command = "colorscheme m3scheme",
})

-- Watch the caelestia shell scheme file from the
-- m3scheme to hot reload the colorscheme.
local uv = vim.loop

local function watch_file(path, fn)
    local h = uv.new_fs_event()
    h:start(vim.fn.expand(path), {}, function() vim.schedule(fn) end)
    return h
end

local _ = watch_file("~/.local/state/caelestia/scheme.json", function()
    vim.defer_fn(function() vim.cmd.colorscheme("m3scheme") end, 150) -- delay in ms
end)
