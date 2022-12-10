local packer = require("packer")
packer.startup({
	-- 插件
	function(use)
		-- Packer可以管理自身
		use("wbthomason/packer.nvim")
		-- 自己的插件列表
		-- 主题
		-- -- 看腻了就去这里找 https://github.com/topics/neovim-colorscheme
		-- 透明插件
		use("xiyaowong/nvim-transparent")
		use("folke/tokyonight.nvim") -- tokyonight主题
		use("mhartington/oceanic-next") -- nceanicNext主题
		use("ellisonleao/gruvbox.nvim") -- gruvBox的lua版本
		use("glepnir/zephyr-nvim") -- 挺好看的
		use("shaunsingh/nord.nvim") -- 很现代化 但是比较素
		use("navarasu/onedark.nvim") -- oneDark 可以说很经典了..
		use("EdenEast/nightfox.nvim") -- 一个插件包含多种配色 Nightfox / Nordfox / Dayfox / Dawnfox / Duskfox，支持非常多的第三方插件。
		use({ "nvim-lualine/lualine.nvim", requires = { "kyazdani42/nvim-web-devicons", opt = true } }) -- 状态栏
		use("arkav/lualine-lsp-progress") -- 状态栏扩展
		-- Telescope
		use({ "nvim-telescope/telescope.nvim", requires = { "nvim-lua/plenary.nvim" } }) -- 搜索
		use("nvim-telescope/telescope-symbols.nvim")
		use("ahmedkhalf/project.nvim") -- 项目管理插件
		use("glepnir/dashboard-nvim") -- 启动页
		use("folke/which-key.nvim") -- 按键提示
		use("rcarriga/nvim-notify")
		use("numToStr/Fterm.nvim") -- 浮动终端
		-- use('kdheepak/lazygit.nvim') -- lazygit
		use("uga-rosa/translate.nvim") -- 翻译
		-- 文件树
		use({
			"nvim-tree/nvim-tree.lua",
			requires = { "nvim-tree/nvim-web-devicons" }, -- optional, for file icons
			tag = "nightly",
		})
		-- tabline 顶部条
		use({ "akinsho/bufferline.nvim", requires = { "nvim-tree/nvim-web-devicons", "moll/vim-bbye" } })
		use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" }) -- 语法高亮
		-- LSP服务
		-- use("williamboman/nvim-lsp-installer") 过时了 替换为mason
		use({ "williamboman/mason.nvim" })
		use({ "williamboman/mason-lspconfig.nvim" })
		-- Lspconfig
		use({ "neovim/nvim-lspconfig" })
		-- 格式化的LSP
		use({ "jose-elias-alvarez/null-ls.nvim", requires = "nvim-lua/plenary.nvim" })
		-- 补全
		-- 补全引擎
		use("hrsh7th/nvim-cmp")
		-- snippet 引擎
		use("hrsh7th/vim-vsnip")
		-- 补全源
		use("hrsh7th/cmp-vsnip")
		use({ "L3MON4D3/LuaSnip", tag = "v<CurrentMajor>.*" })
		use("hrsh7th/cmp-nvim-lsp") -- { name = nvim_lsp }
		use("hrsh7th/cmp-buffer") -- { name = 'buffer' },
		use("hrsh7th/cmp-path") -- { name = 'path' }
		use("hrsh7th/cmp-cmdline") -- { name = 'cmdline' }
		use("ranjithshegde/ccls.nvim") -- ccls
		-- 常见编程语言代码段
		use("rafamadriz/friendly-snippets")
		-- lua nvim增强
		use("folke/neodev.nvim")
		-- 封装图标
		use("onsails/lspkind-nvim")
		-- LSP弹窗
		use("tami5/lspsaga.nvim")
		-- 竖线插件
		use("lukas-reineke/indent-blankline.nvim")
		-- 自动括号
		use({
			"windwp/nvim-autopairs",
			config = function()
				require("nvim-autopairs").setup({})
			end,
		})
		-- code action menu
		use({ "weilbith/nvim-code-action-menu", cmd = "CodeActionMenu" })
		-- 函数签名
		use("ray-x/lsp_signature.nvim")
		-- copilot
		use({
			"zbirenbaum/copilot.lua",
			event = "VimEnter",
			config = function()
				vim.defer_fn(function()
					require("copilot").setup()
				end, 100)
			end,
		})
		-- copilot cpm source
		use({
			"zbirenbaum/copilot-cmp",
			after = { "copilot.lua" },
			config = function()
				require("copilot_cmp").setup()
			end,
		})
		-- vim surround
		use({
			"kylechui/nvim-surround",
			tag = "*", -- Use for stability; omit to use `main` branch for the latest featureskeybindings
			config = function()
				require("nvim-surround").setup({
					-- Configuration here, or leave empty to use defaults
				})
			end,
		})
		use("mg979/vim-visual-multi") -- 多光标"
		-- 函数预览 aerial
		use("stevearc/aerial.nvim")
		-- gitsigns
		use({
			"lewis6991/gitsigns.nvim",
			requires = { "nvim-lua/plenary.nvim" },
		})
		-- dap服务器
		use("mfussenegger/nvim-dap")
		use("rcarriga/nvim-dap-ui")
		use("theHamsta/nvim-dap-virtual-text")
		use("jayp0521/mason-nvim-dap.nvim")

		-- lastpacce
		use("ethanholz/nvim-lastplace")
		-- C++ 生成定义
		use({ "Badhi/nvim-treesitter-cpp-tools", requires = { "nvim-treesitter/nvim-treesitter" } })
		-- cmake
		use("ravenxrz/neovim-cmake")
		-- ui选择框
		use("nvim-telescope/telescope-ui-select.nvim")

		-- use "tom-anders/telescope-vim-bookmarks.nvim"
		use("nvim-telescope/telescope-dap.nvim")
		--[[
            :Telescope dap commands
            :Telescope dap configurations
            :Telescope dap list_breakpoints
            :Telescope dap variables
            :Telescope dap frames
        --]]
	end,

	-- 配置
	config = {
		max_jobs = 16,
		display = {
			open_fn = function()
				return require("packer.util").float({ border = "single" })
			end,
		},
		git = {
			-- default_url_format = "https://hub.fastgit.xyz/%s",
			-- default_url_format = "https://mirror.ghproxy.com/https://github.com/%s",
			-- default_url_format = "https://gitcode.net/mirrors/%s",
			-- default_url_format = "https://gitclone.com/github.com/%s",
			-- default_url_format = "git@github.com:%s", -- 换用 git 协议
		},
	},
})

-- 每次保存 plugins.lua 自动安装插件
pcall(
	vim.cmd,
	[[
    augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
    augroup end
  ]]
)
