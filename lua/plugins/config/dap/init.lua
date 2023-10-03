local dap = require("dap")

local function adapter(name)
    return require("plugins.config.dap." .. name)
end

-- [[ Set adapter ]]
local mason_registry = require("mason-registry")

local codelldb = mason_registry.get_package("codelldb")
local extension_path = codelldb:get_install_path() .. "/extension/"
local codelldb_path = extension_path .. "adapter/codelldb"
-- local liblldb_path = extension_path .. "lldb/lib/liblldb.dylib"

dap.adapters.codelldb = {
    type = "server",
    port = "${port}",
    executable = {
        -- command = '/usr/bin/codelldb',  -- install codelldb-bin with pacman
        command = codelldb_path,
        args = { "--port", "${port}" },
    },
}

-- [[ Load configurations for each language ]]
adapter("clang")
adapter("rust")
adapter("python")

adapter("ui")
