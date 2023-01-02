local status, mnd, mason_config, lsp_setup, mason
local common = require("lsp.common")
status, mason = pcall(require, "mason")
if not status then
	vim.notify("未找到 mason")
	return
end

status, mnd = pcall(require, "mason-nvim-dap") -- 必须在Mason setup后立刻加载mason-nvim-dap
if not status then
	vim.notify("未找到 mason-nvim-dap")
	return
end

status, mason_config = pcall(require, "mason-lspconfig")
if not status then
	vim.notify("未找到 mason-lspconfig")
	return
end

status, lsp_setup = pcall(require, "lsp-setup")
if not status then
	vim.notify("未找到 lsp-setup")
	return
end

local opts = {
	capabilities = common.capabilities,
	flags = common.flags,
	on_attach = common.on_attach,
	root_dir = common.root_dir,
	single_file_support = true,
	default_mappings = false,
	mappings = {},
	server = {
		sumneko_lua = require("lsp.config.lua").opts,
		-- ccls = require("lsp.config.ccls").on_setup(),
		clangd = {
			capabilities = common.capabilities,
			flags = common.flags,
			on_attach = common.on_attach,
			root_dir = common.root_dir,
			single_file_support = true,
			default_mappings = false,
			mappings = {},
			cmd = {
				"clangd",
				-- 在后台自动分析文件（基于complie_commands)
				"--background-index",
				-- 标记compelie_commands.json文件的目录位置
				-- 关于complie_commands.json如何生成可见我上一篇文章的末尾
				-- https://zhuanlan.zhihu.com/p/84876003
				"--compile-commands-dir=build",
				-- 同时开启的任务数量
				"-j=14",
				-- 告诉clangd用那个clang进行编译，路径参考which clang++的路径
				"--query-driver=/usr/bin/clang-cl",
				-- clang-tidy功能
				"--clang-tidy",
				"--clang-tidy-checks=performance-*,bugprone-*",
				-- 全局补全（会自动补充头文件）
				"--all-scopes-completion",
				-- 更详细的补全内容
				"--completion-style=detailed",
				-- 补充头文件的形式
				"--header-insertion=iwyu",
				-- pch优化的位置
				"--pch-storage=disk",
			},
			init_options = {
				compilationDatabaseDirectory = "build",
				clangdFileStatus = true,
			},
		},
	},
}
lsp_setup.setup(opts)

mason.setup({
	ui = {
		icons = {
			package_installed = "✓",
			package_pending = "➜",
			package_uninstalled = "✗",
		},
	},
})

-- mason-lspconfig uses the `lspconfig` server names in the APIs it exposes - not `mason.nvim` package names
-- https://github.com/williamboman/mason-lspconfig.nvim/blob/main/doc/server-mapping.md
mnd.setup({
	ensure_installed = { "cppdbg", "python" },
	automatic_setup = true,
})

mason_config.setup({
	ensure_installed = {
		"sumneko_lua",
		"bashls",
		"jsonls",
		"pyright",
		"yamlls",
		"cmake",
		-- "clangd",
	},
})
