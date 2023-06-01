local status, db = pcall(require, "dashboard")
if not status then
	vim.notify("没有找到dashboard")
	return
end

local tools = require("tools")

local files = vim.fn.readdir(vim.fn.stdpath("config") .. "/static/cats", [[v:val =~ '\.cat$']])
math.randomseed(os.time())
local home = os.getenv("HOME")
local randomVal = math.random(1, #files)
local file = home .. "/.config/nvim/static/cats/" .. files[randomVal]
local fileInfo = tools.get_file_info(file)

-- db.preview_command = 'echo "\n\n\n" | cat && cat | lolcat -F 0.3'
-- db.preview_file_path = file
-- db.preview_file_height = fileInfo.line_num + 3
-- db.preview_file_width = fileInfo.max_line_len

-- 获取Nerd图标 nerdfonts.com/cheat-sheet
-- command = "chafa"
-- file_path = home .. "/.config/nvim/static/badapple.gif"
-- file_height = 30
-- file_width = 80

-- db.custom_header = {
-- 	[[          ▀████▀▄▄              ▄█ ]],
-- 	[[            █▀    ▀▀▄▄▄▄▄    ▄▄▀▀█ ]],
-- 	[[    ▄        █          ▀▀▀▀▄  ▄▀  ]],
-- 	[[   ▄▀ ▀▄      ▀▄              ▀▄▀  ]],
-- 	[[  ▄▀    █     █▀   ▄█▀▄      ▄█    ]],
-- 	[[  ▀▄     ▀▄  █     ▀██▀     ██▄█   ]],
-- 	[[   ▀▄    ▄▀ █   ▄██▄   ▄  ▄  ▀▀ █  ]],
-- 	[[    █  ▄▀  █    ▀██▀    ▀▀ ▀▀  ▄▀  ]],
-- 	[[   █   █  █      ▄▄           ▄▀   ]],
-- }

local opts = {
	-- theme = "doom",
	preview = {
		-- command = "chafa",
		-- file_path = home .. "/.config/nvim/static/badapple.gif",
		-- file_height = 30,
		-- file_width = 80,
		command = 'echo "\n\n\n" | cat && cat | lolcat -F 0.3',
		file_path = file,
		file_height = fileInfo.line_num + 2,
		file_width = fileInfo.max_line_len,
	},
	config = {
		center = {
			{
				icon = "  ",
				desc = "项目                                ",
				action = "Telescope projects",
				shortcut = "SPC f p",
			},
			{
				icon = "  ",
				desc = "最近文件                            ",
				action = "Telescope oldfiles",
				shortcut = "SPC f o",
			},
			{
				icon = "  ",
				desc = "查找文件                            ",
				action = "Telescope find_files",
				shortcut = "SPC f f",
			},
			{
				icon = "  ",
				desc = "查找文本                            ",
				action = "Telescopecope live_grep",
				shortcut = "SPC f a",
			},
			{
				icon = "  ",
				desc = "新建CMake项目                       ",
				action = "CMake create_project",
				shortcut = "SPC c p",
			},
			{
				icon = "  ",
				desc = "编辑nvim配置                        ",
				action = "e ~/.config/nvim/",
				shortcut = "SPC n d",
			},
			{
				icon = "  ",
				desc = "修改主题                            ",
				action = "Telescope colorscheme",
				shortcut = "SPC f t",
			},
		},

		footer = {
			"",
			"",
			"Modolet的NVIM",
			"https://github.com/modolet/nvim",
			"Logo ID: " .. files[randomVal],
		},
	},
}

db.setup(opts)
