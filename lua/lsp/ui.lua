local status, cmp = pcall(require, "cmp")
if not status then
	vim.notify("未找到 CMP")
	return
end

cmp.setup({
	window = {
		completion = cmp.config.window.bordered({ border = "double" }),
	},
})

-- 显示LSP进度
require("fidget").setup({})

-- 自定义图标
vim.diagnostic.config({
	virtual_text = true,
	signs = true,
	update_in_insert = false,
	underline = true,
	show_header = false,
	severity_sort = true,
	float = {
		source = "always",
		border = "rounded",
		style = "minimal",
		header = "",
		-- prefix = " ",
		-- max_width = 100,
		-- width = 60,
		-- height = 20,
	},
})

local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

-- lspkind
local lspkind
status, lspkind = pcall(require, "lspkind")
if not status then
	vim.notify("未找到 lspkind")
	return {}
end

lspkind.init({
	-- default: true
	-- with_text = true,
	-- defines how annotations are shown
	-- default: symbol
	-- options: 'text', 'text_symbol', 'symbol_text', 'symbol'
	mode = "symbol_text",
	-- default symbol map
	-- can be either 'default' (requires nerd-fonts font) or
	-- 'codicons' for codicon preset (requires vscode-codicons font)
	--
	-- default: 'default'
	preset = "codicons",
	-- override preset symbols
	--
	-- default: {}
	symbol_map = {
		Copilot = "",
		Text = "",
		Method = "",
		Function = "",
		Constructor = "",
		Field = "ﰠ",
		Variable = "",
		Class = "ﴯ",
		Interface = "",
		Module = "",
		Property = "ﰠ",
		Unit = "塞",
		Value = "",
		Enum = "",
		Keyword = "",
		Snippet = "",
		Color = "",
		File = "",
		Reference = "",
		Folder = "",
		EnumMember = "",
		Constant = "",
		Struct = "פּ",
		Event = "",
		Operator = "",
		TypeParameter = "",
	},
})

local M = {}
-- 为 cmp.lua 提供参数格式
M.formatting = {
	format = lspkind.cmp_format({
		mode = "symbol_text",
		--mode = 'symbol', -- show only symbol annotations

		maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
		-- The function below will be called before any actual modifications from lspkind
		-- so that you can provide more controls on popup customization. (See [#30](https://github.com/onsails/lspkind-nvim/pull/30))
		before = function(entry, vim_item)
			-- Source 显示提示来源
			local name = string.upper(entry.source.name)
			if name == "NVIM_LSP" then
				name = "NLSP"
			elseif name == "COPILOT" then
				name = "COPI"
			elseif name == "BUFFER" then
				name = "BUFF"
			elseif name == "LUASNIP" then
				name = "SNIP"
			elseif name == "PATH" then
				name = "PATH"
			else
				name = string.sub(name, 1, 4)
			end

			name = string.format("[%s]", name)
			-- vim_item.menu = "[" .. string.upper(entry.source.name) .. "]"
			vim_item.menu = name
			return vim_item
		end,
	}),
}

return M
