-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#sumneko_lua
local runtime_path = vim.split(package.path, ";")
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")
require("neodev").setup()
local common = require("lsp.common")

local opts = {
	capabilities = common.capabilities,
	flags = common.flags,
	on_attach = common.on_attach,
	root_dir = common.root_dir,
	single_file_support = true,
	default_mappings = false,
	mappings = {},
	settings = {
		Lua = {
			runtime = {
				-- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
				version = "LuaJIT",
				-- Setup your lua path
				path = runtime_path,
			},
			diagnostics = {
				-- Get the language server to recognize the `vim` global
				globals = { "vim" },
			},
			workspace = {
				-- Make the server aware of Neovim runtime files
				library = vim.api.nvim_get_runtime_file("", true),
				checkThirdParty = false,
			},
			-- Do not send telemetry data containing a randomized but unique identifier
			telemetry = {
				enable = false,
			},
		},
	},

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

return { opts }
