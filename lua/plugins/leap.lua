local status, leap = pcall(require, "leap")
if not status then
	vim.notify("未找到 leap.nvim")
end

leap.add_default_mappings()

vim.api.nvim_create_autocmd("ColorScheme", {
	callback = function()
		leap.init_highlight(true)
	end,
})
