require("basic")
require("keybindings")
require("plugins")
require("colorscheme")
require("plugins.nvim-notify")

-- 复制到系统剪切板
vim.cmd([[
augroup fix_yank
    autocmd!
    autocmd TextYankPost * if v:event.operator ==# 'y' | call system('/mnt/c/Windows/System32/clip.exe', @0) | endif
augroup END
]])

-- 复制时高亮
vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank({
			higroup = "IncSearch",
			timeout = 100,
		})
	end,
})

for _, file in ipairs(vim.fn.readdir(vim.fn.stdpath("config") .. "/lua/plugins", [[v:val =~ '\.lua$']])) do
	require("plugins." .. file:gsub("%.lua$", ""))
end

require("lsp.setup")
require("lsp.cmp")
require("lsp.ui")
require("dap.setup")

require("tools").welcome()
