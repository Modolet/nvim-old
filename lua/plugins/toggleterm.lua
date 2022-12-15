local status, term = pcall(require, "toggleterm")
if not status then
	vim.notify("未找到 toggleterm")
	return
end

local opts = {
	start_in_insert = true,
	direction = "float",
}

term.setup(opts)
