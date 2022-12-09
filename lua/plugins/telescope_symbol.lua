local status, symbol = pcall(require, "telescope.builtin")
if not status then
	vim.notify("未找到 telescope-symbol.nvim")
	return
end
