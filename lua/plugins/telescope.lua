local status, telescope = pcall(require, "telescope")
if not status then
	vim.notify("未找到 telescope")
	return
end

telescope.setup({
	defaults = {
		-- 打开窗口默认进入插入模式
		initial_mode = "insert",
		mappings = require("keybindings").telescope,
	},
	pickers = {
		find_files = {
			-- 查找文件换皮肤，支持的参数有： dropdown, cursor, ivy
			-- theme = "dropdown",
		},
	},
	extensions = {
		["ui-select"] = {
			require("telescope.themes").get_dropdown({
				-- even more opts
			}),

			-- pseudo code / specification for writing custom displays, like the one
			-- for "codeactions"
			-- specific_opts = {
			--   [kind] = {
			--     make_indexed = function(items) -> indexed_items, width,
			--     make_displayer = function(widths) -> displayer
			--     make_display = function(displayer) -> function(e)
			--     make_ordinal = function(e) -> string
			--   },
			--   -- for example to disable the custom builtin "codeactions" display
			--      do the following
			--   codeactions = false,
			-- }
		},
		-- 扩展插件配置
		-- 扩展列表 https://github.com/nvim-telescope/telescope.nvim/wiki/Extensions
	},
})

telescope.load_extension("ui-select")
telescope.load_extension("toggletasks")
