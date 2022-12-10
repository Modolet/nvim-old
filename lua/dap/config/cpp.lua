local dap = require("dap")

local M = {}
M.setup = function(source_name)
	dap.adapters.cppdbg = {
		id = "cppdbg",
		type = "executable",
		-- command = "OpenDebugAD7",
		-- command = "~/.local/share/nvim/mason/bin/OpenDebugAD7",
		command = "codelldb",
	}
	dap.configurations.cpp = {
		{
			name = "Launch",
			type = "cppdbg",
			request = "launch",
			program = function()
				return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
			end,
			cwd = "${workspaceFolder}",
			stopOnEntry = true,
		},
	}
end

M.opts = {}

return M
