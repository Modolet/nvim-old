local M = {}

M.plugins = {
	-----------------------------------------主题---------------------------------------
	{ "catppuccin/nvim", as = "catppuccin" },
	"folke/tokyonight.nvim", -- tokyonight主题
	"mhartington/oceanic-next", -- nceanicNext主题
	"ellisonleao/gruvbox.nvim", -- gruvBox的lua版本
	"glepnir/zephyr-nvim", -- 挺好看的
	"shaunsingh/nord.nvim", -- 很现代化 但是比较素
	"navarasu/onedark.nvim", -- oneDark 可以说很经典了..
	"EdenEast/nightfox.nvim", -- 一个插件包含多种配色 Nightfox / Nordfox / Dayfox / Dawnfox / Duskfox，支持非常多的第三方插件。
	{ "nyoom-engineering/oxocarbon.nvim" },
	"xiyaowong/nvim-transparent", -- 透明插件
	"rafamadriz/neon",
	-- -- 看腻了就去这里找 https://github.com/topics/neovim-colorscheme
	-----------------------------------------功能---------------------------------------
	"jedrzejboczar/toggletasks.nvim",
	"lukas-reineke/indent-blankline.nvim", -- 竖线插件
	"akinsho/toggleterm.nvim", -- 终端插件
	"nkakouros-original/numbers.nvim", -- 自动切换为绝对行号
	"aserowy/tmux.nvim", -- tmux
	"lewis6991/impatient.nvim", -- 加速lua
	"numToStr/Comment.nvim", -- 快速注释
	{ "nvim-lualine/lualine.nvim", dependencies = { "nvim-tree/nvim-web-devicons", opt = true } }, -- 状态栏
	-- "arkav/lualine-lsp-progress", -- 状态栏扩展
	"glepnir/dashboard-nvim", -- 启动页
	"folke/which-key.nvim", -- 按键提示
	"rcarriga/nvim-notify", -- 弹窗通知
	"potamides/pantran.nvim", -- 翻译

	{ -- 文件树
		"nvim-tree/nvim-tree.lua",
		dependencies = { "nvim-tree/nvim-web-devicons" }, -- optional, for file icons
		tag = "nightly",
	},
	-- "stevearc/aerial.nvim", -- 函数预览 aerial
	"simrat39/symbols-outline.nvim", -- 函数预览
	{ "akinsho/bufferline.nvim", dependencies = { "nvim-tree/nvim-web-devicons", "moll/vim-bbye" } }, -- 顶部条
	"mg979/vim-visual-multi", -- 多光标 不知道为啥 太鸡儿卡了 找了个替代品
	-- { "otavioschwanck/cool-substitute.nvim" }, -- 多光标替代版 有机会换回来 没vim-visual-multi好用
	{ -- gitsigns
		"lewis6991/gitsigns.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
	},
	{
		"kylechui/nvim-surround",
		tag = "*", -- Use for stability; omit to use `main` branch for the latest featureskeybindings
		config = function()
			require("nvim-surround").setup({
				-- Configuration here, or leave empty to use defaults
			})
		end,
	},
	"ethanholz/nvim-lastplace", -- lastpacce
	"ggandor/leap.nvim", -- 快速跳转插件
	"windwp/nvim-spectre", -- 查找替换插件
	"haringsrob/nvim_context_vt", -- 显示上下文
	"p00f/nvim-ts-rainbow", -- 彩虹括号
	{ -- 滚动条
		"petertriho/nvim-scrollbar",
		config = function()
			require("scrollbar").setup()
		end,
	},
	"karb94/neoscroll.nvim", -- 平滑滚动
	{ -- 在头部显示LSP上下文
		"utilyre/barbecue.nvim",
		dependencies = {
			"neovim/nvim-lspconfig",
			"smiteshp/nvim-navic",
			"nvim-tree/nvim-web-devicons", -- optional
		},
		-- after = "nvim-web-devicons", -- NOTICE: keep this if you're using NvChad
		config = function()
			require("barbecue").setup()
		end,
	},
	{ "kevinhwang91/nvim-hlslens" }, -- 搜索高亮插件
	"yamatsum/nvim-cursorline", -- 高亮当前选中词
	{ "kevinhwang91/nvim-ufo", dependencies = "kevinhwang91/promise-async" }, -- 更现代化的折叠
	-----------------------------------------Telescope----------------------------------
	{ "nvim-telescope/telescope.nvim", dependencies = { "nvim-lua/plenary.nvim" }, tag = "0.1.0" }, -- 搜索
	{ -- 提高telescope性能
		"nvim-telescope/telescope-fzf-native.nvim",
		run = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
	},
	"nvim-telescope/telescope-symbols.nvim",
	"ahmedkhalf/project.nvim", -- 项目管理插件
	{ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" }, -- 语法高亮
	{ "Badhi/nvim-treesitter-cpp-tools", dependencies = { "nvim-treesitter/nvim-treesitter" } }, -- C++ 生成定义
	"nvim-telescope/telescope-ui-select.nvim", -- ui选择框
	-- use "tom-anders/telescope-vim-bookmarks.nvim"
	"nvim-telescope/telescope-dap.nvim",
	-- use({ -- 高亮显示函数参数
	-- 	"m-demare/hlargs.nvim",
	-- 	dependencies = { "nvim-treesitter/nvim-treesitter" },
	-- })
	-----------------------------------------单元测试-----------------------------------
	{
		"nvim-neotest/neotest",
		dependencies = {
			"nvim-neotest/neotest-go",
			-- Your other test adapters here
		},
		config = function()
			-- get neotest namespace (api call creates or returns namespace)
			local neotest_ns = vim.api.nvim_create_namespace("neotest")
			vim.diagnostic.config({
				virtual_text = {
					format = function(diagnostic)
						local message =
							diagnostic.message:gsub("\n", " "):gsub("\t", " "):gsub("%s+", " "):gsub("^%s+", "")
						return message
					end,
				},
			}, neotest_ns)
			require("neotest").setup({
				-- your neotest config here
				adapters = {
					require("neotest-go"),
				},
			})
		end,
	},
	-----------------------------------------LSP----------------------------------------
	"jubnzv/virtual-types.nvim", -- 用虚拟文本显示变量类型
	"rmagatti/goto-preview", -- 更好的预览
	{ "williamboman/mason.nvim" }, -- LSP管理
	{ "williamboman/mason-lspconfig.nvim" },
	{ "neovim/nvim-lspconfig" }, -- LSP配置
	{ "jose-elias-alvarez/null-ls.nvim", dependencies = "nvim-lua/plenary.nvim" }, -- 格式化
	{ "folke/trouble.nvim", dependencies = "nvim-tree/nvim-web-devicons" }, -- Trouble
	{ -- LSP快速配置
		"junnplus/lsp-setup.nvim",
		dependencies = {
			"neovim/nvim-lspconfig",
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
		},
	},
	{ -- 灯泡插件
		"kosayoda/nvim-lightbulb",
		dependencies = "antoinemadec/FixCursorHold.nvim",
		config = function()
			require("nvim-lightbulb").setup({ autocmd = { enabled = true } })
		end,
	},
	"j-hui/fidget.nvim", -- 显示LSP进度
	-----------------------------------------补全---------------------------------------
	"hrsh7th/nvim-cmp", -- 补全引擎
	"lukas-reineke/cmp-under-comparator", -- 调整补全顺序
	"hrsh7th/cmp-nvim-lsp", -- LSP源
	"L3MON4D3/LuaSnip", -- SNIP源
	"saadparwaiz1/cmp_luasnip",
	"hrsh7th/cmp-buffer", -- { name = 'buffer' },
	"hrsh7th/cmp-path", -- { name = 'path' }
	"hrsh7th/cmp-cmdline", -- { name = 'cmdline' }
	"ranjithshegde/ccls.nvim", -- ccls
	{ -- copilot
		"zbirenbaum/copilot.lua",
		event = "VimEnter",
		config = function()
			vim.defer_fn(function()
				require("copilot").setup()
				---@diagnostic disable-next-line: param-type-mismatch
			end, 100)
		end,
	},
	{ -- copilot-cmp
		"zbirenbaum/copilot-cmp",
		after = { "copilot.lua" },
		config = function()
			require("copilot_cmp").setup()
		end,
	},
	"rafamadriz/friendly-snippets", -- 常见编程语言代码段
	"folke/neodev.nvim", -- nvim的lua源
	"onsails/lspkind-nvim", -- 封装图标
	"tami5/lspsaga.nvim", -- LSP弹窗
	{ -- 自动括号
		"windwp/nvim-autopairs",
		config = function()
			require("nvim-autopairs").setup({})
		end,
	},
	{ "weilbith/nvim-code-action-menu", cmd = "CodeActionMenu" }, -- CodeActionMenu
	"ray-x/lsp_signature.nvim", -- 函数签名
	-- "hrsh7th/vim-vsnip",
	-- 补全源
	-- "hrsh7th/cmp-vsnip",
	-- lua nvim增强
	-- code action menu
	-- copilot
	-- copilot cpm source
	-- vim surround
	-----------------------------------------DAP----------------------------------------
	"mfussenegger/nvim-dap",
	"rcarriga/nvim-dap-ui",
	"theHamsta/nvim-dap-virtual-text",
	"jayp0521/mason-nvim-dap.nvim",
}

M.opts = {}

return M
