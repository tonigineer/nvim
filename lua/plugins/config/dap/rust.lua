-- local dap = require("dap")

-- local mason_registry = require("mason-registry")

-- local codelldb = mason_registry.get_package("codelldb")
-- local extension_path = codelldb:get_install_path() .. "/extension/"
-- local codelldb_path = extension_path .. "adapter/codelldb"
-- local liblldb_path = extension_path .. "lldb/lib/liblldb.dylib"

-- -- dap = {
-- -- adapter = require("rust-tools.dap").get_codelldb_adapter(codelldb_path, liblldb_path),
-- -- }

-- dap.configurations.rust = {
-- 	{
-- 		name = "Rust",
-- 		type = "codelldb",
-- 		request = "launch",
-- 		program = function()
-- 			os.execute("cargo build >> /dev/null")
-- 			return "target/debug/${workspaceFolderBasename}"
-- 		end,
-- 		args = function()
-- 			local argv = {}
-- 			arg = vim.fn.input(string.format("Arguments: "))
-- 			for i in string.gmatch(arg, "%S+") do
-- 				table.insert(argv, i)
-- 			end
-- 			return argv
-- 		end,
-- 		cwd = "${workspaceFolder}",
-- 		stopOnEntry = false
-- 	}
-- }