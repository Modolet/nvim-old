local M = {}

M.keyAttach = function(bufnr)
	local function buf_set_keymap(mode, lhs, rhs)
		vim.keymap.set(mode, lhs, rhs, { noremap = true, silent = true, buffer = bufnr })
	end

	-- 绑定快捷键
	require("keybindings").mapLSP(buf_set_keymap)
end

-- 禁用格式化功能，交给专门的插件处理
-- M.disableFormat = function(client)
--     if vim.fn.has("nvim-0.8") == 1 then
--         client.server_capabilities.documentFormattingProvider = false
--         client.server_capabilities.documentRangeFormattingProvider = false
--     else
--         client.resolved_capabilities.document_formatting = false
--         client.resolved_capabilities.document_range_formatting = false
--     end
-- end

M.signature = function(bufnr)
	local status, lsp_signature = pcall(require, "lsp_signature")
	if not status then
		vim.notify("未找到 lsp_signature")
		return
	end
	-- lsp_signature.on_attach(signature_setup, bufnr)
	lsp_signature.on_attach({}, bufnr)
end

local util = require("lspconfig.util")
local default_capabilities =
	vim.tbl_deep_extend("force", util.default_config.capabilities or vim.lsp.protocol.make_client_capabilities(), {
		textDocument = {
			completion = {
				editsNearCursor = true,
			},
			foldingRange = {
				dynamicRegistration = true,
				lineFoldingOnly = true,
			},
		},
		offsetEncoding = { "utf-8", "utf-16" },
	})

-- M.capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())
-- M.capabilities = require("cmp_nvim_lsp").default_capabilities()
-- default_capabilities = require("cmp_nvim_lsp").default_capabilities()
M.capabilities = default_capabilities
M.flags = {
	debounce_text_changes = 150,
}

M.root_dir = require("tools").rootDir
M.on_attach = function(client, bufnr)
	-- require("virtualtypes").on_attach(client, bufnr)
	-- M.disableFormat(client)
	M.signature(bufnr)
	require("tools").setpwd()
end

return M
