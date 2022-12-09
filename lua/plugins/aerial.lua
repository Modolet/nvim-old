local status, aerial = pcall(require, "aerial")
if not status then
	vim.notify("未找到 aerial.nvim", vim.log.levels.ERROR)
	return
end

aerial.setup({
	layout = {
		max_width = { 50, 0.35 },
		width = 35,
		min_width = 20,
	},
	ignore = {
		unlisted_buffers = true,
		filetypes = {
			"dashboard",
			"NvimTree",
		},
		buftypes = "special",
		wintypes = "special",
	},
})
