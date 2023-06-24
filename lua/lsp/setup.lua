local status, mnd, mason_config, lsp_setup, mason
local common = require("lsp.common")
vim.cmd([[ autocmd BufRead,BufNewFile *.slint set filetype=slint ]])

require("lspconfig").clangd.setup({})
require("lspconfig").pyright.setup({})
require("lspconfig").slint_lsp.setup({})
-- require("lsp.config.rust")
-- require("lspconfig").rust_analyzer.setup({})
-- require("lspconfig").ccls.setup({})

status, mason = pcall(require, "mason")
if not status then
	vim.notify("未找到 mason")
	return
end

status, mnd = pcall(require, "mason-nvim-dap") -- 必须在Mason setup后立刻加载mason-nvim-dap
if not status then
	vim.notify("未找到 mason-nvim-dap")
	return
end

status, mason_config = pcall(require, "mason-lspconfig")
if not status then
	vim.notify("未找到 mason-lspconfig")
	return
end

status, lsp_setup = pcall(require, "lsp-setup")
if not status then
	vim.notify("未找到 lsp-setup")
	return
end

local opts = {
	capabilities = common.capabilities,
	flags = common.flags,
	on_attach = common.on_attach,
	root_dir = common.root_dir,
	single_file_support = true,
	default_mappings = false,
	mappings = {},
	servers = {
		sumneko_lua = require("lsp.config.lua").opts,
		ccls = require("lsp.config.ccls").opts,
		clangd = require("lsp.config.clangd").opts,
		rust_analyzer = {},
		slint_lsp = {
			-- root_dir = common.root_dir,
		},
	},
}
lsp_setup.setup(opts)

mason.setup({
	ui = {
		icons = {
			package_installed = "✓",
			package_pending = "➜",
			package_uninstalled = "✗",
		},
	},
})

-- mason-lspconfig uses the `lspconfig` server names in the APIs it exposes - not `mason.nvim` package names
-- https://github.com/williamboman/mason-lspconfig.nvim/blob/main/doc/server-mapping.md
mnd.setup({
	ensure_installed = { "cppdbg", "python" },
	automatic_setup = true,
})

mason_config.setup({
	ensure_installed = {
		"lua_ls",
		"bashls",
		"jsonls",
		"pyright",
		"yamlls",
		"cmake",
		-- "clangd",
	},
})
