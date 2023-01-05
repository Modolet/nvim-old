local status, lualine = pcall(require, "lualine")
if not status then
	vim.notify("未找到 lualine")
	return
end

local get_time = function()
	local time = os.date("%H:%M:%S")
	return time
end

local get_date = function()
	local date = os.date("%Y年%m月%d日")
	return date
end

lualine.setup({
	options = {
		icons_enabled = true,
		theme = "auto",
		-- component_separators = { left = "", right = "" },
		section_separators = { left = "", right = "" },
		component_separators = { left = "|", right = "|" },
		-- section_separators = { left = " ", right = "" },
		disabled_filetypes = {
			statusline = {},
			winbar = {},
		},
		ignore_focus = {},
		always_divide_middle = true,
		globalstatus = true,
		refresh = {
			statusline = 1000,
			tabline = 1000,
			winbar = 1000,
		},
	},
	sections = {
		lualine_a = {
			function()
				-- 获取系统用户名并返回
				return vim.fn.expand("$USER")
			end,
			"mode",
		},
		lualine_b = { "branch", "diff", "diagnostics" },
		lualine_c = {
			function()
				return vim.api.nvim_call_function("getcwd", {})
			end,
			"filename",
			-- {
			-- 	"lsp_progress",
			-- 	spinner_symbols = { " ", " ", " ", " ", " ", " " },
			-- },
		},
		lualine_x = { "encoding", "fileformat", "filetype" },
		lualine_y = { "location", "progress" },
		lualine_z = { get_date, get_time },
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = { "filename" },
		lualine_x = { "location" },
		lualine_y = {},
		lualine_z = {},
	},
	tabline = {},
	winbar = {},
	inactive_winbar = {},
	extensions = { "nvim-tree", "toggleterm" },
})
