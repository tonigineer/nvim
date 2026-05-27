require("tonigineer.lazy")
require("tonigineer.remap")
require("tonigineer.set")
require("tonigineer.autocmds")

-- Workaround: Ensure m3scheme in light mode is applied correctly.
vim.api.nvim_create_autocmd("User", {
    pattern = "VeryLazy",
    once = true,
    command = "colorscheme vague",
})

-- Watch the caelestia shell scheme file to hot-reload m3scheme.
local uv = vim.loop

local function watch_file(path, fn)
    local handle = uv.new_fs_event()
    handle:start(vim.fn.expand(path), {}, function() vim.schedule(fn) end)
    return handle
end

watch_file("~/.local/state/caelestia/scheme.json", function()
    vim.defer_fn(function() vim.cmd.colorscheme("m3scheme") end, 150)
end)
