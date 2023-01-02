local status, null_ls = pcall(require, "null-ls")
if not status then
	vim.notify("没有找到 null-ls")
	return
end

local clang_format_path = vim.fn.stdpath("config") .. "/static/clang-format"
local lsp_formatting = require("tools").lsp_formatting

-- if you want to set up formatting on save, you can use this as a callback
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

null_ls.setup({
	debug = true,
	sources = {
		null_ls.builtins.formatting.stylua,
		null_ls.builtins.formatting.gofmt,
		-- null_ls.builtins.formatting.spell,
		-- null_ls.builtins.diagnostics.cpplint,
		null_ls.builtins.formatting.clang_format.with({
			extra_args = { "-style", "file:" .. clang_format_path },
		}),
	},
	-- -- 保存自动格式化
	on_attach = function(client, bufnr)
		if client.supports_method("textDocument/formatting") then
			vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = augroup,
				buffer = bufnr,
				callback = function()
					lsp_formatting(bufnr)
				end,
			})
		end
	end,
})
