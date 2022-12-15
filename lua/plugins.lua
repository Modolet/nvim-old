---@diagnostic disable: param-type-mismatch
local packer = require("packer")
packer.startup({
    -- 插件
    function(use)
        -----------------------------------------Packer-------------------------------------
        use("wbthomason/packer.nvim")
        -- 自己的插件列表
        -----------------------------------------主题---------------------------------------
        use({ "catppuccin/nvim", as = "catppuccin" })
        use("folke/tokyonight.nvim") -- tokyonight主题
        use("mhartington/oceanic-next") -- nceanicNext主题
        use("ellisonleao/gruvbox.nvim") -- gruvBox的lua版本
        use("glepnir/zephyr-nvim") -- 挺好看的
        use("shaunsingh/nord.nvim") -- 很现代化 但是比较素
        use("navarasu/onedark.nvim") -- oneDark 可以说很经典了..
        use("EdenEast/nightfox.nvim") -- 一个插件包含多种配色 Nightfox / Nordfox / Dayfox / Dawnfox / Duskfox，支持非常多的第三方插件。
        use({ "nyoom-engineering/oxocarbon.nvim" })
        use("xiyaowong/nvim-transparent") -- 透明插件
        use("rafamadriz/neon")
        -- -- 看腻了就去这里找 https://github.com/topics/neovim-colorscheme
        -----------------------------------------功能---------------------------------------
        -- use({ -- 在终端显示图像
        -- 	"samodostal/image.nvim",
        -- 	requires = {
        -- 		"nvim-lua/plenary.nvim",
        -- 		{ "m00qek/baleia.nvim", tag = "v1.2.0" },
        -- 	},
        -- })
        -- use({
        -- 	"adelarsq/image_preview.nvim",
        -- 	config = function()
        -- 		require("image_preview").setup()
        -- 	end,
        -- }) -- 在终端显示图片2
        use("lukas-reineke/indent-blankline.nvim") -- 竖线插件
        use("akinsho/toggleterm.nvim") -- 终端插件
        -- use({ -- task插件
        -- 	"jedrzejboczar/toggletasks.nvim",
        -- 	requires = {
        -- 		"nvim-lua/plenary.nvim",
        -- 		"akinsho/toggleterm.nvim",
        -- 		"nvim-telescope/telescope.nvim/",
        -- 	},
        -- 	-- To enable YAML config support
        -- 	rocks = "lyaml",
        -- })
        -- use({
        -- 	"pianocomposer321/yabs.nvim",
        -- 	requires = { "nvim-lua/plenary.nvim" },
        -- })
        use("nkakouros-original/numbers.nvim") -- 自动切换为绝对行号
        use("aserowy/tmux.nvim") -- tmux
        use("lewis6991/impatient.nvim") -- 加速lua
        use("numToStr/Comment.nvim") -- 快速注释
        use({ "nvim-lualine/lualine.nvim", requires = { "kyazdani42/nvim-web-devicons", opt = true } }) -- 状态栏
        use("arkav/lualine-lsp-progress") -- 状态栏扩展
        use("glepnir/dashboard-nvim") -- 启动页
        use("folke/which-key.nvim") -- 按键提示
        use("rcarriga/nvim-notify") -- 弹窗通知
        use({
            "potamides/pantran.nvim",
        }) -- 翻译
        use({ -- 文件树
            "nvim-tree/nvim-tree.lua",
            requires = { "nvim-tree/nvim-web-devicons" }, -- optional, for file icons
            tag = "nightly",
        })
        use("stevearc/aerial.nvim") -- 函数预览 aerial
        use({ "akinsho/bufferline.nvim", requires = { "nvim-tree/nvim-web-devicons", "moll/vim-bbye" } }) -- 顶部条
        -- use("mg979/vim-visual-multi") -- 多光标 不知道为啥 太鸡儿卡了 找了个替代品
        use({ "otavioschwanck/cool-substitute.nvim" }) -- 多光标替代版 有机会换回来 没vim-visual-multi好用
        use({ -- gitsigns
            "lewis6991/gitsigns.nvim",
            requires = { "nvim-lua/plenary.nvim" },
        })
        use({
            "kylechui/nvim-surround",
            tag = "*", -- Use for stability; omit to use `main` branch for the latest featureskeybindings
            config = function()
                require("nvim-surround").setup({
                    -- Configuration here, or leave empty to use defaults
                })
            end,
        })
        use("ethanholz/nvim-lastplace") -- lastpacce
        use("ggandor/leap.nvim") -- 快速跳转插件
        use("windwp/nvim-spectre") -- 查找替换插件
        use("haringsrob/nvim_context_vt") -- 显示上下文
        use("p00f/nvim-ts-rainbow") -- 彩虹括号
        use({ -- 滚动条
            "petertriho/nvim-scrollbar",
            config = function()
                require("scrollbar").setup()
            end,
        })
        use("karb94/neoscroll.nvim") -- 平滑滚动
        use({ -- 在头部显示LSP上下文
            "utilyre/barbecue.nvim",
            requires = {
                "neovim/nvim-lspconfig",
                "smiteshp/nvim-navic",
                "kyazdani42/nvim-web-devicons", -- optional
            },
            -- after = "nvim-web-devicons", -- NOTICE: keep this if you're using NvChad
            config = function()
                require("barbecue").setup()
            end,
        })
        use({ "kevinhwang91/nvim-hlslens" }) -- 搜索高亮插件
        use("yamatsum/nvim-cursorline") -- 高亮当前选中词
        use({ "kevinhwang91/nvim-ufo", requires = "kevinhwang91/promise-async" }) -- 更现代化的折叠
        -----------------------------------------Telescope----------------------------------
        use({ "nvim-telescope/telescope.nvim", requires = { "nvim-lua/plenary.nvim" } }) -- 搜索
        use("nvim-telescope/telescope-symbols.nvim")
        use("ahmedkhalf/project.nvim") -- 项目管理插件
        use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" }) -- 语法高亮
        use({ "Badhi/nvim-treesitter-cpp-tools", requires = { "nvim-treesitter/nvim-treesitter" } }) -- C++ 生成定义
        use("nvim-telescope/telescope-ui-select.nvim") -- ui选择框
        -- use "tom-anders/telescope-vim-bookmarks.nvim"
        use("nvim-telescope/telescope-dap.nvim")
        -- use({ -- 高亮显示函数参数
        -- 	"m-demare/hlargs.nvim",
        -- 	requires = { "nvim-treesitter/nvim-treesitter" },
        -- })
        -----------------------------------------LSP----------------------------------------
        use({ "williamboman/mason.nvim" }) -- LSP管理
        use({ "williamboman/mason-lspconfig.nvim" })
        use({ "neovim/nvim-lspconfig" }) -- LSP配置
        use({ "jose-elias-alvarez/null-ls.nvim", requires = "nvim-lua/plenary.nvim" }) -- 格式化
        use({ "folke/trouble.nvim", requires = "kyazdani42/nvim-web-devicons" }) -- Trouble
        use({ -- LSP快速配置
            "junnplus/lsp-setup.nvim",
            requires = {
                "neovim/nvim-lspconfig",
                "williamboman/mason.nvim",
                "williamboman/mason-lspconfig.nvim",
            },
        })
        -----------------------------------------补全---------------------------------------
        use("hrsh7th/nvim-cmp") -- 补全引擎
        use("lukas-reineke/cmp-under-comparator") -- 调整补全顺序
        use("hrsh7th/cmp-nvim-lsp") -- LSP源
        use("L3MON4D3/LuaSnip") -- SNIP源
        use("saadparwaiz1/cmp_luasnip")
        use("hrsh7th/cmp-buffer") -- { name = 'buffer' },
        use("hrsh7th/cmp-path") -- { name = 'path' }
        use("hrsh7th/cmp-cmdline") -- { name = 'cmdline' }
        use("ranjithshegde/ccls.nvim") -- ccls
        use({ -- copilot
            "zbirenbaum/copilot.lua",
            event = "VimEnter",
            config = function()
                vim.defer_fn(function()
                    require("copilot").setup()
                    ---@diagnostic disable-next-line: param-type-mismatch
                end, 100)
            end,
        })
        use({ -- copilot-cmp
            "zbirenbaum/copilot-cmp",
            after = { "copilot.lua" },
            config = function()
                require("copilot_cmp").setup()
            end,
        })
        use("rafamadriz/friendly-snippets") -- 常见编程语言代码段
        use("folke/neodev.nvim") -- nvim的lua源
        use("onsails/lspkind-nvim") -- 封装图标
        use("tami5/lspsaga.nvim") -- LSP弹窗
        use({ -- 自动括号
            "windwp/nvim-autopairs",
            config = function()
                require("nvim-autopairs").setup({})
            end,
        })
        use({ "weilbith/nvim-code-action-menu", cmd = "CodeActionMenu" }) -- CodeActionMenu
        use("ray-x/lsp_signature.nvim") -- 函数签名
        -- use("hrsh7th/vim-vsnip")
        -- 补全源
        -- use("hrsh7th/cmp-vsnip")
        -- lua nvim增强
        -- code action menu
        -- copilot
        -- copilot cpm source
        -- vim surround
        -----------------------------------------DAP----------------------------------------
        use("mfussenegger/nvim-dap")
        use("rcarriga/nvim-dap-ui")
        use("theHamsta/nvim-dap-virtual-text")
        use("jayp0521/mason-nvim-dap.nvim")
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
            -- default_url_format = "https://ghproxy.com/https://github.com/%s",
            -- default_url_format = "https://hub.fastgit.xyz/%s",
            -- default_url_format = "https://mirror.ghproxy.com/https://github.com/%s",
            -- default_url_format = "https://gitcode.net/mirrors/%s",
            -- default_url_format = "https://gitclone.com/github.com/%s",
            default_url_format = "git@github.com:%s", -- 换用 git 协议
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
