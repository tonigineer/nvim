local mason_registry = require("mason-registry")
local debugpy_path = mason_registry.get_package("debugpy")

require("dap-python").setup(debugpy_path:get_install_path() .. "/venv/bin/python")
