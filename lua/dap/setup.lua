local status, dap = pcall(require, "dap")
if not status then
	vim.notify("未找到 dap", vim.log.levels.ERROR)
	return
end

local status, dapui = pcall(require, "dapui")
if not status then
	vim.notify("未找到 dapui", vim.log.levels.ERROR)
	return
end

local status, vt = pcall(require, "nvim-dap-virtual-text")
if not status then
	vim.notify("未找到 dap-virtual-text", vim.log.levels.ERROR)
	return
end

local status, mnd = pcall(require, "mason-nvim-dap")
if not status then
	vim.notify("未找到 mason-nvim-dap", vim.log.levels.ERROR)
	return
end

if dap and dapui and vt then
	require("dap.dapui")

	vt.setup({
		commented = true,
	})

	dapui.setup({
		element_mappings = {
			scopes = {
				open = "<CR>",
				edit = "e",
				expand = "o",
				repl = "r",
			},
		},
		-- layouts = {
		-- 	{
		-- 		elements = {
		-- 			-- Elements can be strings or table with id and size keys.
		-- 			{ id = "scopes", size = 0.4 },
		-- 			"stacks",
		-- 			"watches",
		-- 			"breakpoints",
		-- 			"console",
		-- 		},
		-- 		size = 0.35, -- 40 columns
		-- 		position = "left",
		-- 	},
		-- 	{
		-- 		elements = {
		-- 			"repl",
		-- 		},
		-- 		size = 0.25, -- 25% of total lines
		-- 		position = "bottom",
		-- 	},
		-- },
		-- floating = {
		-- 	max_height = nil, -- These can be integers or a float between 0 and 1.
		-- 	max_width = nil, -- Floats will be treated as percentage of your screen.
		-- 	border = "rounded", -- Border style. Can be "single", "double" or "rounded"
		-- 	mappings = {
		-- 		close = { "q", "<Esc>" },
		-- 	},
		-- },
	})

	dap.listeners.after.event_initialized["dapui_config"] = function()
		-- 执行LSPStop
		vim.cmd("LspStop")
		dapui.open({})
	end
	dap.listeners.before.event_terminated["dapui_config"] = function()
		vim.cmd("LspStart")
		dapui.close({})
	end
	dap.listeners.before.event_exited["dapui_config"] = function()
		vim.cmd("LspStart")
		dapui.close({})
	end
end

mnd.setup()
