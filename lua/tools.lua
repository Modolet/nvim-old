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

local lspconfig = require("lspconfig")
local mason = require("mason-lspconfig")

M.func = function()
	for _, server in ipairs(mason.get_installed_servers()) do
		print(server)
	end
end

return M