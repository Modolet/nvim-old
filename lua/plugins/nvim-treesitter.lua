local status, treesitter = pcall(require, "nvim-treesitter.configs")
if not status then
	vim.notify("未找到 nvim-treesitter")
	return
end

local list_keys = require("keybindings").treesitter

treesitter.setup({
	-- 安装 language parser
	-- :TSInstallInfo 命令查看支持的语言
	ensure_installed = { "json", "html", "css", "vim", "lua", "c", "cpp", "python" },
	-- ensure_installed = "all",
	-- 启用代码高亮模块
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
		disable = function(lang, buf)
			local max_filesize = 100 * 1024 -- 100 KB
			local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
			if ok and stats and stats.size > max_filesize then
				return true
			end
		end,
	},
	incremental_selection = {
		enable = true,
		keymaps = list_keys,
	},
	indent = {
		enable = false,
	},
	-- 配置nvim-treesitter-cpp-tools
	-- nt_cpp_tools = {
	-- 	enable = true,
	-- 	preview = {
	-- 		quit = "q", -- optional keymapping for quit preview
	-- 		accept = "<tab>", -- optional keymapping for accept preview
	-- 	},
	-- 	header_extension = "h", -- optional
	-- 	source_extension = "cpp", -- optional
	-- 	custom_define_class_function_commands = { -- optional
	-- 		TSCppImplWrite = {
	-- 			output_handle = require("nvim-treesitter.nt-cpp-tools.output_handlers").get_add_to_cpp(),
	-- 		},
	-- 		--[[
	--            <your impl function custom command name> = {
	--                output_handle = function (str, context)
	--                    -- string contains the class implementation
	--                    -- do whatever you want to do with it
	--                end
	--            }
	--            ]]
	-- 	},
	-- },
	rainbow = { -- 彩虹括号
		enable = true,
		-- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
		extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
		max_file_lines = nil, -- Do not enable for files with more than n lines, int
		-- colors = {}, -- table of hex strings
		-- termcolors = {} -- table of colour name strings
	},
})
