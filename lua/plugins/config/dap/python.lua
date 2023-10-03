local mason_registry = require("mason-registry")
local debugpy_path = mason_registry.get_package("debugpy")

local dap = require("dap")

dap.adapters.python = {
    type = "executable",
    command = debugpy_path:get_install_path() .. "/venv/bin/python",
    args = { "-m", "debugpy.adapter" },
}

dap.configurations = {
    python = {
        {
            type = "python",
            request = "launch",
            name = "Run file",
            program = "${file}",
            pythonPath = function()
                local cwd = vim.fn.getcwd()
                if vim.fn.executable(cwd .. "/venv/bin/python") == 1 then
                    return cwd .. "/venv/bin/python"
                elseif vim.fn.executable(cwd .. "/.venv/bin/python") == 1 then
                    return cwd .. "/.venv/bin/python"
                else
                    return "/usr/bin/python"
                end
            end,
        },
    },
},

require("dap-python").setup(debugpy_path:get_install_path() .. "/venv/bin/python")