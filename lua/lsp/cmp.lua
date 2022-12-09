local status, cmp = pcall(require, "cmp")
if not status then
	vim.notify("未找到 cmp")
	return
end

cmp.setup({
	-- ghost text
	experimental = {
		ghost_text = true,
	},
	-- 设置中文也能触发
	completion = {
		-- autocomplete = false,
		-- keyword_length = 1,
		keyword_pattern = "[\\u4e00-\\u9fa5a-zA-Z^0-9]",
	},
	-- 指定 snippet 引擎
	snippet = {
		expand = function(args)
			-- For `vsnip` users.
			vim.fn["vsnip#anonymous"](args.body)

			-- For `luasnip` users.
			-- require('luasnip').lsp_expand(args.body)

			-- For `ultisnips` users.
			-- vim.fn["UltiSnips#Anon"](args.body)

			-- For `snippy` users.
			-- require'snippy'.expand_snippet(args.body)
		end,
	},
	-- 补全源
	sources = cmp.config.sources({
		{ name = "copilot" },
		{ name = "nvim_lsp" },
		-- For vsnip users.
		-- { name = "vsnip" },

		-- For luasnip users.
		{ name = "luasnip" },

		--For ultisnips users.
		-- { name = 'ultisnips' },

		-- -- For snippy users.
		-- { name = 'snippy' },
		{ name = "buffer" },
		{ name = "path" },
	}),

	-- 快捷键设置
	mapping = require("keybindings").cmp(cmp),
	-- 使用Lspkind-nvim显示类型图标
	formatting = require("lsp.ui").formatting,
})

-- / 查找模式使用 buffer 源
cmp.setup.cmdline("/", {
	mapping = cmp.mapping.preset.cmdline(),
	sources = {
		{ name = "buffer" },
	},
})

-- : 命令行模式中使用 path 和 cmdline 源.
cmp.setup.cmdline(":", {
	mapping = cmp.mapping.preset.cmdline(),
	sources = cmp.config.sources({
		{ name = "path" },
	}, {
		{ name = "cmdline" },
	}),
})
