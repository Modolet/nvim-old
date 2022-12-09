local common = require("lsp.common")
local lsputil
local status, ccls = pcall(require, "ccls")
if not status then
	vim.notify("未找到 ccls")
	return
end

status, lsputil = pcall(require, "lspconfig.util")
if not status then
	vim.notify("未找到 lspconfig.util")
	return
end

local opts = {
	capabilities = common.capabilities,
	flags = common.flags,
	on_attach = function(client, bufnr)
		common.disableFormat(client)
		common.keyAttach(bufnr)
		common.signature(bufnr)
	end,
	root_dir = function(fname)
		return lsputil.root_pattern("compile_commands.json", "compile_flags.txt", ".git")(fname)
			or lsputil.find_git_ancestor(fname)
			or "."
	end,
	single_file_support = true,
	-- custom handler
	-- handlers = {
	--   ["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
	--     virtual_text = false,
	--     signs = true,
	--     underline = true,
	--     update_in_insert = false,
	--   }),
	-- },
}

return {
	on_setup = function()
		ccls.setup({
			lsp = {
				lspconfig = opts,
				codelens = {
					enable = true,
					envents = { "BufWritePost", "InsertLeave" },
				},
			},
		})
	end,
}
