local M = {}
local enable = true

if not enable then
	return {
		on_setup = function() end,
	}
end

local common = require("lsp.common")

M.opts = {
	capabilities = common.capabilities,
	flags = common.flags,
	on_attach = common.on_attach,
	root_dir = common.root_dir,
	single_file_support = true,
	default_mappings = false,
	mappings = {},
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

-- M.on_setup = function()
-- 	ccls.setup({
-- 		lsp = {
-- 			lspconfig = opts,
-- 			-- codelens = {
-- 			-- 	enable = false,
-- 			-- 	envents = { "BufWritePost", "InsertLeave" },
-- 			-- },
-- 			--#region 和clang共存
-- 			-- disable_capabilities = {
-- 			-- 	completionProvider = true,
-- 			-- 	documentFormattingProvider = true,
-- 			-- 	documentRangeFormattingProvider = true,
-- 			-- 	documentHighlightProvider = true,
-- 			-- 	documentSymbolProvider = true,
-- 			-- 	workspaceSymbolProvider = true,
-- 			-- 	renameProvider = true,
-- 			-- 	hoverProvider = true,
-- 			-- 	codeActionProvider = true,
-- 			-- },
-- 			-- disable_diagnostics = true,
-- 			-- disable_signature = true,
-- 		},
-- 	})
-- end

return M
