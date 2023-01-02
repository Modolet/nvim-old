require("plugins")
require("basic")
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

-- 保存缩进
-- vim.api.nvim_create_autocmd("BufWinLeave", {
--     pattern = { "*.*" },
--     callback = function()
--         pcall(vim.cmd, "mkview")
--     end,
-- })

-- 读取缩进、取消换行自动注释
-- vim.api.nvim_create_autocmd("BufWinEnter", {
--     pattern = { "*.*" },
--     callback = function()
--         pcall(vim.cmd, "loadview")
--         vim.cmd("setlocal formatoptions-=c formatoptions-=r formatoptions-=o")
--     end,
-- })

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
	require("plugins." .. file:gsub("%.lua$", ""))
end

require("lsp.setup")
require("lsp.cmp")
require("lsp.ui")
require("dap.setup")
require("tools").welcome()
