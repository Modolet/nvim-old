local status, wk = pcall(require, "which-key")
if not status then
	vim.notify("未找到 which-key", vim.log.levels.ERROR)
	return
end

local register = {
	["<leader>"] = {
		name = "主菜单",
		-- 关闭所有窗口和标签页，然后打开dashboard
		a = { "<cmd>Dashboard<cr>", "Dashboard" },
		x = {
			name = "Trouble",
			x = { "<cmd>TroubleToggle<cr>", "查看Trouble" },
			w = { "<cmd>TroubleToggle workspace_diagnostics<cr>", "工作区" },
			d = { "<cmd>TroubleToggle document_diagnostics<cr>", "文档" },
			q = { "<cmd>TroubleToggle quickfix<cr>", "快速修复" },
			l = { "<cmd>TroubleToggle loclist<cr>", "locllist" },
			-- nnoremap gR <cmd>TroubleToggle lsp_references<cr>
		},
		-- 取消搜索高亮
		h = { "<cmd>noh<cr>", "取消搜索高亮" },
		e = {
			"<cmd>lua require('tools').setpwd()<cr><cmd>NvimTreeToggle<cr><cmd>lua require('tools').setpwd()<cr>",
			"文件管理器",
		},
		o = { "<cmd>SymbolsOutline<cr>", "大纲" },
		-- 查找项目
		p = { "<cmd>Telescope projects<CR>", "项目" },
		f = {
			name = "查找",
			p = { "<cmd>Telescope projects<CR>", "项目" },
			o = { "<cmd>Telescope oldfiles<CR>", "最近文件" },
			f = { "<cmd>Telescope find_files<cr>", "文件" },
			a = { "<cmd>Telescope live_grep<cr>", "全局搜索" },
			c = { "<cmd>Telescope commands<cr>", "命令" },
			k = { "<cmd>Telescope keymaps<cr>", "快捷键" },
			t = { "<cmd>Telescope colorscheme<cr>", "主题" },
			g = { "<cmd>Telescope git_status<cr>", "git" },
		},
		t = {
			name = "终端、翻译",
			-- h = { ":sp | terminal<CR>", "纵向分屏终端" },
			-- i = { ":vsp | terminal<CR>", "横向分屏终端" },
			-- f = { "<CMD>lua require('FTerm').toggle()<CR>", "浮动终端" },
			i = { "<cmd>ToggleTerm direction=horizontal size=20<cr>", "纵向分屏终端" },
			v = { "<cmd>ToggleTerm direction=vertical size=60<cr>", "横向分屏终端" },
			f = { "<cmd>ToggleTerm direction=float<cr>", "浮动终端" },
			t = { [[<cma>Pantran<cr>]], "翻译" },
			g = {
				[[<cmd>lua require('toggleterm.terminal').Terminal:new({ cmd = "lazygit", hidden = true }):toggle()<cr>]],
				"lazygit",
			},
		},
		n = {
			name = "NVIM配置",
			-- 编辑NVIM目录
			d = { "<cmd>edit ~/.config/nvim/<cr>", "编辑NVIM配置" },
			-- whichkey
			w = { "<cmd>edit ~/.config/nvim/lua/plugins/whichkey.lua<cr>", "编辑whichkey" },
			-- 特殊快捷键
			k = { "<cmd>edit ~/.config/nvim/lua/keybindings.lua<cr>", "编辑keymappings" },
			-- 主题
			t = { "<cmd>edit ~/.config/nvim/lua/colorscheme.lua<cr>", "编辑主题" },
			-- 插件
			p = { "<cmd>edit ~/.config/nvim/lua/plugins.lua<cr>", "编辑插件" },
			-- 重新读取配置
			r = { "<cmd>luafile %<cr>", "重新读取配置" },
		},
		c = {
			name = "Tasks",
			t = { "<cmd>Telescope toggletasks spawn<cr>", "Tasks Spawn" },
			e = { "<cmd>Telescope toggletasks edit<cr>", "Tasks Edit" },
			s = { "<cmd>Telescope toggletasks select<cr>", "Tasks Select" },
		},
		r = {
			name = "查找替换",
			f = { "<cmd>lua require('spectre').open_file_search()<cr>", "当前文件查找" },
			a = { "<cmd>lua require('spectre').open_visual()<cr>", "全局查找" },
			w = { "<cmd>lua require('spectre').open_file_search({select_word=true})<cr>", "当前文件查找选中" },
			W = { "<cmd>lua require('spectre').open_visual({select_word=true})<cr>", "全局查找选中" },
		},
	},

	t = {
		name = "标签页、终端、翻译",
		t = { "<cmd>Telescope toggletasks spawn<cr>", "Task Spawn" },
		r = { [[<cmd>Pantran<cr>]], "翻译" },
		n = { "<cmd>tabnew<cr>", "新建标签页" },
		l = { "<cmd>BufferLineCycleNext<cr>", "下个标签页" },
		h = { "<cmd>BufferLineCyclePrev<cr>", "上个标签页" },
		c = {
			name = "关闭标签页",
			c = { "<cmd>Bdelete<cr>", "关闭当前标签页" },
			l = { "<cmd>BufferLineCoseLeft<cr>", "关闭左边标签页" },
			h = { "<cmd>BufferLineCoseRight<cr>", "关闭右边标签页" },
			o = { "<cmd>BufferLineCloseAllButCurrent<cr>", "关闭其他标签页" },
			a = { "<cmd>BufferLineCloseAll<cr>", "关闭所有标签页" },
		},
		v = { "<cmd>ToggleTerm direction=horizontal size=20<cr>", "纵向分屏终端" },
		i = { "<cmd>ToggleTerm direction=vertical size=60<cr>", "横向分屏终端" },
		f = { "<cmd>ToggleTerm direction=float<cr>", "浮动终端" },
		g = {
			[[<cmd>lua require('toggleterm.terminal').Terminal:new({ cmd = "lazygit", hidden = true }):toggle()<cr>]],
			"lazygit",
		},
		z = { ":Translate ZH<CR>", "翻译为中文" },
		e = { ":Translate EN<CR>", "翻译为英文" },
		a = {
			[[<cmd>lua require('toggleterm.terminal').Terminal:new({ cmd = "ranger", hidden = true }):toggle()<cr>]],
			"ranger",
		},
	},
	s = {
		name = "分屏、搜索",
		-- 切换分屏
		n = { "<C-w>w", "下个分屏" },
		p = { "<C-w>p", "上个分屏" },
		v = { ":vsp<CR>", "横向分屏" },
		i = { ":sp<CR>", "纵向分屏" },
		h = { "<C-w>h", "左边分屏" },
		j = { "<C-w>j", "下边分屏" },
		k = { "<C-w>k", "上边分屏" },
		l = { "<C-w>l", "右边分屏" },
		H = { "<C-w>H", "分屏移到左侧" },
		J = { "<C-w>J", "分屏移到下侧" },
		K = { "<C-w>K", "分屏移到上侧" },
		L = { "<C-w>L", "分屏移到右侧" },
		["="] = { [[<C-w>=]], "等比例分屏" },
		--#region 搜索
		-- 小写搜索当前文件，大写搜索所有文件
		-- 用spectre搜索当前单词
		w = { "<cmd>lua require('spectre').open_file_search({select_word = true})<cr>", "搜索当前单词" },
		f = { "<cmd>lua require('spectre').open_file_search()<cr>", "搜索" },
		W = { "<cmd>lua require('spectre').open_visual({select_word = true})<cr>", "搜索当前单词(所有文件)" },
		F = { "<cmd>lua require('spectre').open_visual()<cr>", "搜索(所有文件)" },

		--#endregion
	},
	g = {
		name = "跳转",
		-- LSP操作全部使用Lspsaga实现
		-- d = { "<cmd>lua require('tools').gd()<CR>", "转到定义" },
		-- r = { "<cmd>lua require('lspsaga.provider').lsp_finder()<CR>", "转到引用" },
		a = { "<cmd>lua require('tools').toggle_header()<CR>", "头文件与源文件切换" },
		t = { "V:TSCppDefineClassFunc<cr>", "生成定义" },
		T = { "V:TSCppImplWrite", "生成定义并写入到源文件" },
		d = { "<cmd>lua require('goto-preview').goto_preview_definition()<CR>", "转到定义" },
		r = { "<cmd>lua require('goto-preview').goto_preview_references()<CR>", "转到引用" },
		i = { "<cmd>lua require('goto-preview').goto_preview_implementation()<CR>", "转到实现" },
		n = { "<cmd>lua require('lspsaga.rename').rename()<CR>", "重命名" },
		h = { "<cmd>lua require('lspsaga.hover').render_hover_doc()<CR>", "查看Hover" },
		p = { "<cmd>lua require('lspsaga.diagnostic').show_line_diagnostics()<CR>", "查看当前行诊断" },
		j = { "<cmd>Lspsaga diagnostic_jump_next<cr>", "下一个诊断" },
		k = { "<cmd>Lspsaga diagnostic_jump_prev<cr>", "上一个诊断" },
		f = { [[<cmd>lua require("tools").lsp_formatting()<cr>]], "格式化" },
		c = { "<cmd>CodeActionMenu<CR>", "代码操作" },
	},
}

local vregister = {
	J = { [[mz:move .+1<CR>==`z]], "下移一行" },
	K = { [[mz:move .-2<CR>==`z]], "上移一行" },
	[">"] = { [[>gv]], "缩进" },
	["<"] = { [[<gv]], "反缩进" },
	t = { ":Pantran<cr>", "翻译" },
	g = {
		name = "跳转",
		a = { "<cmd>lua require('tools').toggle_header()<CR>", "头文件与源文件切换" },
		t = { ":TSCppDefineClassFunc<cr>", "生成定义" },
		T = { ":TSCppImplWrite", "生成定义并写入到源文件" },
	},
}

local nopts = {
	mode = "n", -- NORMAL mode
	buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
	silent = true, -- use `silent` when creating keymaps
	noremap = true, -- use `noremap` when creating keymaps
	nowait = true, -- use `nowait` when creating keymaps
}
local vopts = nopts
vopts.mode = "v" -- VISUAL mode

local setup = {
	plugins = {
		marks = false, -- shows a list of your marks on ' and `
		registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
		spelling = {
			enabled = false, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
			suggestions = 20, -- how many suggestions should be shown in the list?
		},
		-- the presets plugin, adds help for a bunch of default keybindings in Neovim
		-- No actual key bindings are created
		presets = {
			operators = false, -- adds help for operators like d, y, ... and registers them for motion / text object completion
			motions = false, -- adds help for motions
			text_objects = false, -- help for text objects triggered after entering an operator
			windows = true, -- default bindings on <c-w>
			nav = true, -- misc bindings to work with windows
			z = false, -- bindings for folds, spelling and others prefixed with z
			g = false, -- bindings for prefixed with g
		},
	},
	-- add operators that will trigger motion and text object completion
	-- to enable all native operators, set the preset / operators plugin above
	-- operators = { gc = "Comments" },
	-- key_labels = {
	-- override the label used to display some keys. It doesn't effect WK in any other way.
	-- For example:
	-- ["<space>"] = "SPC",
	-- ["<cr>"] = "RET",
	-- ["<tab>"] = "TAB",
	-- },
	icons = {
		breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
		separator = "➜", -- symbol used between a key and it's label
		group = "+", -- symbol prepended to a group
	},
	popup_mappings = {
		scroll_down = "<c-d>", -- binding to scroll down inside the popup
		scroll_up = "<c-u>", -- binding to scroll up inside the popup
	},
	window = {
		border = "rounded", -- none, single, double, shadow
		position = "bottom", -- bottom, top
		margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
		padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
		winblend = 0,
	},
	layout = {
		height = { min = 4, max = 25 }, -- min and max height of the columns
		width = { min = 20, max = 50 }, -- min and max width of the columns
		spacing = 3, -- spacing between columns
		align = "center", -- align columns left, center or right
	},
	ignore_missing = true, -- enable this to hide mappings for which you didn't specify a label
	hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " }, -- hide mapping boilerplate

	show_help = true, -- show help message on the command line when the popup is visible
	triggers = "auto", -- automatically setup triggers
	-- triggers = {"<leader>"} -- or specify a list manually
	triggers_blacklist = {
		-- list of mode / prefixes that should never be hooked by WhichKey
		-- this is mostly relevant for key maps that start with a native binding
		-- most people should not need to change this
		i = { "j", "k" },
		v = { "j", "k" },
	},
}

wk.register(register, { mode = "n" })
wk.register(vregister, { mode = "v" })
wk.setup(setup)
