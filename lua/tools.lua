local M = {}
local status, lsputil = pcall(require, "lspconfig.util")
if not status then
	vim.notify("未找到 lspconfig.util")
	return
end

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

M.lsp_formatting = function(bufnr)
	vim.lsp.buf.format({
		filter = function(client)
			-- apply whatever logic you want (in this example, we'll only use null-ls)
			return client.name == "null-ls"
		end,
		bufnr = bufnr,
	})
end

M.welcome = function()
	local notify = function(msg)
		vim.notify(msg, "info", { title = "Welcome", timeout = 200 })
	end
	-- 获取用户名
	local user = vim.fn.expand("$USER")
	local hour = os.date("%H")
	if tonumber(hour) < 6 then
		notify([[ 😊凌晨了，要注意休息吖, ]] .. user .. [[! 😊]])
	elseif tonumber(hour) < 9 then
		notify([[ 🥰早上好, ]] .. user .. [[! 今天也要元气满满呐~ 🥰]])
	elseif tonumber(hour) < 12 then
		notify([[🍲上午好, ]] .. user .. [[! 要记得吃早饭吖~ 🍲]])
	elseif tonumber(hour) < 14 then
		notify([[🏀中午好, ]] .. user .. [[! 多出去走走吖~🏀]])
	elseif tonumber(hour) < 17 then
		notify([[☕下午好, ]] .. user .. [[! 记得多喝水吖~☕]])
	elseif tonumber(hour) < 19 then
		notify([[👪傍晚好, ]] .. user .. [[! 记得多陪陪亲爱的人呐~👪]])
	elseif tonumber(hour) < 22 then
		notify([[🌙晚上好, ]] .. user .. [[! 累了可以洗个热水澡哦~🌙]])
	else
		notify("🛌夜深了,快睡觉吧~ " .. user .. "! 🛌")
	end
end

M.getRandomCatFile = function()
	local files = vim.fn.readdir(vim.fn.stdpath("config") .. "/static/cats", [[v:val =~ '\.cat$']])
	math.randomseed(os.time())
	return files[math.random(1, #files)]
end

-- 获取指定文件的行数和最长的一行的字符数 用于dashboard
M.get_file_info = function(file)
	local ret = {
		line_num = 0,
		max_line_len = 0,
	}
	local f = io.open(file, "r")
	if f == nil then
		return ret
	end
	for line in f:lines() do
		ret.line_num = ret.line_num + 1
		if string.len(line) > ret.max_line_len then
			ret.max_line_len = string.len(line)
		end
	end
	f:close()
	return ret
end

M.func = function()
	M.switch_cpp_file()
end

M.rootDir = function(fname)
	if fname == nil then
		fname = vim.fn.expand("%:p")
	end

	return lsputil.root_pattern(".git", ".hg", ".svn", "package.json", "go.mod", "Cargo.toml")(fname)
		or lsputil.root_pattern("CMakeLists.txt", "Makefile")(fname)
		or lsputil.find_git_ancestor(fname)
		or "."
end

M.setpwd = function(pwd)
	if pwd == nil then
		pwd = M.rootDir()
	end
	vim.api.nvim_set_current_dir(pwd)
end

M.toggle_header = function()
	-- 获取当前文件类型
	local filetype = vim.bo.filetype
	if filetype ~= "cpp" then
		return
	end
	local header_file_ext = { ".h" } -- 头文件扩展名
	local source_file_ext = { ".cpp", ".c++", ".cc" } -- 源文件扩展名
	local cur_dir = vim.fn.expand("%:p:h")
	local cur_file_name_no_ext = vim.fn.expand("%:t:r")
	local cur_file_ext = vim.fn.expand("%:e")
	cur_file_ext = "." .. cur_file_ext
	for _, ext in ipairs(header_file_ext) do
		if cur_file_ext == ext then
			-- 头文件
			for _, ext1 in ipairs(source_file_ext) do
				local file = cur_dir .. "/" .. cur_file_name_no_ext .. ext1
				if vim.fn.filereadable(file) == 1 then
					vim.notify("switch to " .. file, "info", { title = "Switch", timeout = 10 })
					vim.cmd("e " .. file)
					return true
				end
			end
		end
	end
	for _, ext in ipairs(source_file_ext) do
		if cur_file_ext == ext then
			-- 源文件
			for _, ext1 in ipairs(header_file_ext) do
				local file = cur_dir .. "/" .. cur_file_name_no_ext .. ext1
				if vim.fn.filereadable(file) == 1 then
					vim.notify("switch to " .. file, "info", { title = "Switch", timeout = 10 })
					vim.cmd("e " .. file)
					return true
				end
			end
		end
	end
	return false
end

return M
