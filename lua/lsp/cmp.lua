local status, cmp = pcall(require, "cmp")
if not status then
	vim.notify("未找到 cmp")
	return
end
cmp.setup({
	-- ghost text
	experimental = {
		ghost_text = true,
	},
	-- 设置中文也能触发
	completion = {
		-- autocomplete = false,
		-- keyword_length = 1,
		keyword_pattern = "[\\u4e00-\\u9fa5a-zA-Z^0-9]",
	},
