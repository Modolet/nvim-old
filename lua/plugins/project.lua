local status, project = pcall(require, "project_nvim")
if not status then
	vim.notify("未找到 project_nvim")
	return
end

-- nvim-tree 支持
vim.g.nvim_tree_respect_buf_cwd = 1

project.setup({
	detection_methods = { "pattern" },
	patterns = {
		".git",
		"_darcs",
		".hg",
		".bzr",
		".svn",
		"Makefile",
		"CMakeLists.txt",
		"package.json",
		".sln",
		"xmake.lua",
	},
})

local status, telescope = pcall(require, "telescope")
if not status then
	vim.notify("project_nvim 未找到 telescope")
	return
end
pcall(telescope.load_extension, "projects")

-- 运行命令 :lua print(require("project_nvim.utils.path").historyfile) 就可以看到 project_history 文件的路径了。
