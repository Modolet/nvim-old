local common = require("lsp.common")

local opts = {
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
}

return opts
