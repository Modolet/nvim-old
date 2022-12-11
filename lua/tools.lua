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

M.welcome = function()
	-- 获取用户名
	local user = vim.fn.expand("$USER")
	local hour = os.date("%H")
	if tonumber(hour) < 6 then
		vim.notify([[ 😊凌晨了，要注意休息吖, ]] .. user .. [[! 😊]])
	elseif tonumber(hour) < 9 then
		vim.notify([[ 🥰早上好, ]] .. user .. [[! 今天也要元气满满呐~ 🥰]])
	elseif tonumber(hour) < 12 then
		vim.notify([[🍲上午好, ]] .. user .. [[! 要记得吃早饭吖~ 🍲]])
	elseif tonumber(hour) < 14 then
		vim.notify([[🏀中午好, ]] .. user .. [[! 多出去走走吖~🏀]])
	elseif tonumber(hour) < 17 then
		vim.notify([[☕下午好, ]] .. user .. [[! 记得多喝水吖~☕]])
	elseif tonumber(hour) < 19 then
		vim.notify([[👪傍晚好, ]] .. user .. [[! 记得多陪陪亲爱的人呐~👪]])
	elseif tonumber(hour) < 22 then
		vim.notify([[🌙晚上好, ]] .. user .. [[! 累了可以洗个热水澡哦~🌙]])
	else
		vim.notify("🛌夜深了,快睡觉吧~ " .. user .. "! 🛌")
	end
end
return M
