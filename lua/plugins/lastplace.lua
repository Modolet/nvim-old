local status, ls = pcall(require, "nvim-lastplace")
if not status then
	vim.notify("未找到 nvim-lastplace", vim.log.levels.ERROR)
	return
end

ls.setup({
	lastplace_ignore_buftype = { "quickfix", "nofile", "help" },
	lastplace_ignore_filetype = { "gitcommit", "gitrebase", "svn", "hgcommit" },
	lastplace_open_folds = false,
})
