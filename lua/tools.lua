local M = {}

M.append_semicolon = function()
	local cur_line_num = vim.fn.line(".")
	local cur_line = vim.fn.getline(cur_line_num)
	local need_semicolon = true
	if type(cur_line) ~= "string" then
		return
	end
	local i = string.len(cur_line)
	while i ~= 0 do
		local s = string.sub(cur_line, i, i)
		if s ~= " " and s ~= "\t" then
			if s == ";" then
				need_semicolon = false
				break
			else
				break
			end
		end
		i = i - 1
	end
	if i == 0 then
		need_semicolon = false
	end
	if true == need_semicolon then
		vim.fn.setline(cur_line_num, cur_line .. ";")
	end
end

M.func = function()
	local clang_format_path = vim.fn.stdpath("config") .. "static/clang-format"
	print(clang_format_path)
end

M.gd = function()
	require("telescope.builtin").lsp_definitions({
		initial_mode = "normal",
		-- ignore_filename = false,
	})
end

return M
