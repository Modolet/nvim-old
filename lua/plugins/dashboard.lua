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

-- 获取Nerd图标 nerdfonts.com/cheat-sheet
-- db.preview_command = "chafa"
-- db.preview_file_path = home .. "/.config/nvim/static/badapple.gif"
db.preview_command = 'echo "\n\n\n" | cat && cat | lolcat -F 0.3'
db.preview_file_path = file
db.preview_file_height = fileInfo.line_num + 3
db.preview_file_width = fileInfo.max_line_len
-- db.preview_file_height = 30
-- db.preview_file_width = 80

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

db.custom_footer = {
	"",
	"",
	"Modolet的NVIM",
	"https://github.com/modolet/nvim",
	"Logo ID: " .. files[randomVal],
}

db.custom_center = {
	{
		icon = "  ",
		desc = "项目                                ",
		action = "Telescope projects",
	},
	{
		icon = "  ",
		desc = "最近文件                            ",
		action = "Telescope oldfiles",
	},
	{
		icon = "  ",
		desc = "编辑按键绑定                        ",
		action = "edit ~/.config/nvim/lua/keybindings.lua",
	},
	{
		icon = "  ",
		desc = "编辑项目                            ",
		action = "edit ~/.local/share/nvim/project_nvim/project_history",
	},
	{
		icon = "  ",
		desc = "编辑nvim配置                        ",
		action = "edit ~/.config/nvim",
	},
	{
		icon = "  ",
		desc = "修改主题                            ",
		action = "ChangeColorScheme",
	},
	{
		icon = "  ",
		desc = "查找文件                            ",
		action = "Telescope find_files",
	},
	{
		icon = "  ",
		desc = "查找文本                            ",
		action = "Telescopecope live_grep",
	},
}
