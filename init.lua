local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.notify("开始安装lazy.nvim")
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
	vim.notify("lazy.nvim安装完成，请重新启动NVIM")
	return
end
vim.opt.rtp:prepend(lazypath)
local plugins = require("plugins").plugins
local opts = require("plugins").opts
require("basic")
require("lazy").setup(plugins, opts)

require("keybindings")
require("colorscheme")
require("plugins.nvim-notify")
require("impatient")

-- 复制到系统剪切板
-- vim.cmd([[
-- augroup fix_yank
--     autocmd!
--     autocmd TextYankPost * if v:event.operator ==# 'y' | call system('/mnt/c/Windows/System32/clip.exe', @0) | endif
-- augroup END
-- ]])

-- 保存缩进 、设置Pwd
vim.api.nvim_create_autocmd("BufWinLeave", {
	pattern = { "*" },
	callback = function()
		pcall(vim.cmd, "mkview")
	end,
})

vim.api.nvim_create_autocmd("DirChanged", {
	pattern = { "*" },
	callback = function()
		require("tools").setpwd()
	end,
})

-- 读取缩进、取消换行自动注释
vim.api.nvim_create_autocmd("BufWinEnter", {
	pattern = { "*" },
	callback = function()
		pcall(vim.cmd, "loadview")
		vim.cmd("setlocal formatoptions-=c formatoptions-=r formatoptions-=o")
	end,
})

vim.api.nvim_create_autocmd("BufRead", {
	pattern = { "*.ixx", "*.mpp" },
	callback = function()
		vim.cmd("setlocal filetype=cpp")
	end,
})

vim.api.nvim_create_autocmd("BufNewFile", {
	pattern = { "*.ixx", "*.mpp" },
	callback = function()
		vim.cmd("setlocal filetype=cpp")
	end,
})

-- 复制高亮
vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank({
			higroup = "IncSearch",
			timeout = 100,
		})
	end,
})

-- 读取插件配置
for _, file in ipairs(vim.fn.readdir(vim.fn.stdpath("config") .. "/lua/plugins", [[v:val =~ '\.lua$']])) do
	xpcall(function()
		require("plugins." .. file:gsub("%.lua$", ""))
	end, function() end)
end

require("lsp.setup")
require("lsp.cmp")
require("lsp.ui")
require("dap.setup")
require("tools").welcome()
