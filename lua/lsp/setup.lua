local status, mason = pcall(require, "mason")
if not status then
	vim.notify("未找到 mason")
	return
end

local status, mason_config = pcall(require, "mason-lspconfig")
if not status then
	vim.notify("未找到 mason-lspconfig")
	return
end

local status, lspconfig = pcall(require, "lspconfig")
if not status then
	vim.notify("未找到 lspconfig")
	return
end

-- :h mason-default-settings
-- ~/.local/share/nvim/mason
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
mason_config.setup({
	ensure_installed = {
		"sumneko_lua",
		-- "tsserver",
		-- "tailwindcss",
		"bashls",
		-- "cssls",
		-- "dockerls",
		-- "emmet_ls",
		--  "html",
		"jsonls",
		"pyright",
		-- "rust_analyzer",
		-- "taplo",
		"yamlls",
		-- "gopls",
		-- "clangd",
		-- "cpplint",
		-- "cpptools",
		"cmake",
	},
})

local isLsp = function(name)
	local nolsp = {
		"cpptools",
		"cpplint",
	}
	for _, v in ipairs(nolsp) do
		if v == name then
			return false
		end
	end
end

local setupConfig = function(name, config)
	if config ~= nil and type(config) == "table" then
		-- 自定义初始化配置文件必须实现on_setup 方法
		config.on_setup(lspconfig[name])
	else
		if true then
			local common = require("lsp.common")
			local opts = {
				capabilities = common.capabilities,
				flags = common.flags,
				on_attach = function(client, bufnr)
					common.disableFormat(client)
					common.keyAttach(bufnr)
					common.signature(bufnr)
				end,
			}
			-- 使用默认参数
			lspconfig[name].setup(opts)
		else
			lspconfig[name].setup({})
		end
	end
end

for _, server in ipairs(mason_config.get_installed_servers()) do
	if server == "sumneko_lua" then
		setupConfig(server, require("lsp.config.lua"))
	elseif server == "clangd" then
		setupConfig(server, require("lsp.config.clangd"))
	else
		setupConfig(server, nil)
	end
end

require("lsp.config.ccls").on_setup()
