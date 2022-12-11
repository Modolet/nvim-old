vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- 测试
vim.api.nvim_set_keymap("n", "<leader>dd", "<cmd>lua require('tools').func()<CR>", { noremap = true, silent = true })

local map = vim.api.nvim_set_keymap
local opt = { noremap = true, silent = true }

-- 给行尾添加分号并新开一行
map("i", "<M-o>", "<Esc>:lua require('tools').append_semicolon()<CR>o", opt)
map("i", "<M-O>", "<Esc>:lua require('tools').append_semicolon()<CR>O", opt)
map("n", "<M-o>", ":lua require('tools').append_semicolon()<CR>o", opt)
map("n", "<M-O>", ":lua require('tools').append_semicolon()<CR>O", opt)
map("n", "H", "^", opt)
map("n", "L", "$", opt)
map("v", "H", "^", opt)
map("v", "L", "$", opt)
map("n", [[\]], "q", opt)
map("n", "q", "<Plug>(leap-forward-to)", opt)
map("n", "Q", "<Plug>(leap-backward-to)", opt)
map("n", "gq", "<Plug>(leap-cross-window)", opt)

-- 取消原本S键的功能
map("n", "s", "", opt)
map("n", "so", "", opt)

-- 左右比例控制
map("n", "<C-Left>", "2<C-w><", opt)
map("n", "<C-Right>", "2<C-w>>", opt)
-- 上下比例控制
map("n", "<C-Up>", "2<C-w>+", opt)
map("n", "<C-Down>", "2<C-w>-", opt)

-- Terminal相关
-- map("t", "<Esc>", "<C-\\><C-n>", opt)

-- 代码移动
-- 上下滚动浏览
map("n", "<C-j>", "4j", opt)
map("n", "<C-k>", "4k", opt)
-- ctrl u / ctrl + d  只移动9行，默认移动半屏
map("n", "<C-u>", "9k", opt)
map("n", "<C-d>", "9j", opt)

-- 保存、退出
map("n", "<C-q>", ":q<CR>", opt)
map("n", "<C-s>", ":w<CR>", opt)

-- 全选
map("n", "<C-a>", "ggVG", opt)

-- 插件快捷键
local pluginKeys = {}

pluginKeys.nvimTree = {
	-- 打开文件或文件夹
	{ key = { "<CR>", "o", "<2-LeftMouse>" }, action = "edit" },
	-- 分屏打开文件
	{ key = "v", action = "vsplit" },
	{ key = "h", action = "split" },
	-- 显示隐藏文件
	{ key = "i", action = "toggle_custom" }, -- 对应 filters 中的 custom (node_modules)
	{ key = ".", action = "toggle_dotfiles" }, -- Hide (dotfiles)
	-- 文件操作
	{ key = { "<F5>", "r" }, action = "refresh" },
	{ key = "a", action = "create" },
	{ key = "d", action = "remove" },
	{ key = "r", action = "rename" },
	{ key = "x", action = "cut" },
	{ key = "c", action = "copy" },
	{ key = "p", action = "paste" },
	{ key = "s", action = "system_open" },
}

-- telescope
map("n", "<C-p>", ":Telescope find_files<CR>", opt) -- 查找文件
map("n", "<C-f>", ":Telescope live_grep<CR>", opt) -- 全局搜索
pluginKeys.telescope = {
	i = {
		-- 上下移动
		["<C-j>"] = "move_selection_next",
		["<C-k>"] = "move_selection_previous",
		["<Down>"] = "move_selection_next",
		["<Up>"] = "move_selection_previous",
		-- 历史记录
		["<C-n>"] = "cycle_history_next",
		["<C-p>"] = "cycle_history_prev",
		-- 关闭窗口
		["<C-q>"] = "close",
		-- 预览窗口上下滚动
		["<C-u>"] = "preview_scrolling_up",
		["<C-d>"] = "preview_scrolling_down",
	},
}

-- treesitter
pluginKeys.treesitter = {
	init_selection = "<CR>",
	node_incremental = "<CR>",
	node_decremental = "<BS>",
	scope_incremental = "<TAB>",
}

-- mapLSP
-- 配置到whichkey内
pluginKeys.mapLSP = function(mapbuf)
	-- rename
	--[[
  Lspsaga 替换 rn
  mapbuf("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opt)
  --]]
	-- mapbuf("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", opt)
	-- code action
	--[[
  Lspsaga 替换 ca
  mapbuf("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opt)
  --]]
	-- mapbuf("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", opt)
	-- go xx
	--[[
    mapbuf('n', 'gd', '<cmd>Lspsaga preview_definition<CR>', opt)
  --]]
	-- mapbuf("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opt)
	--[[
  Lspsaga 替换 gh
  mapbuf("n", "gh", "<cmd>lua vim.lsp.buf.hover()<CR>", opt)
  --]]
	-- mapbuf("n", "gh", "<cmd>Lspsaga hover_doc<cr>", opt)
	--[[
  Lspsaga 替换 gr
  mapbuf("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opt)
  --]]
	-- mapbuf("n", "gr", "<cmd>Lspsaga lsp_finder<CR>", opt)
	--[[
  Lspsaga 替换 gp, gj, gk
  mapbuf("n", "gp", "<cmd>lua vim.diagnostic.open_float()<CR>", opt)
  mapbuf("n", "gj", "<cmd>lua vim.diagnostic.goto_next()<CR>", opt)
  mapbuf("n", "gk", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opt)
  --]]
	-- diagnostic
	-- mapbuf("n", "gp", "<cmd>Lspsaga show_line_diagnostics<CR>", opt)
	-- mapbuf("n", "gj", "<cmd>Lspsaga diagnostic_jump_next<cr>", opt)
	-- mapbuf("n", "gk", "<cmd>Lspsaga diagnostic_jump_prev<cr>", opt)
	-- mapbuf("n", "<leader>fc", "<cmd>lua vim.lsp.buf.format()<CR>", opt)
	-- 未用
	-- mapbuf("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opt)
	-- mapbuf("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opt)
	-- mapbuf('n', '<leader>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opt)
	-- mapbuf("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opt)
	-- mapbuf('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opt)
	-- mapbuf('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opt)
	-- mapbuf('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opt)
	-- mapbuf('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opt)
end

-- CMP
pluginKeys.cmp = function(cmp)
	local has_words_before = function()
		local line, col = unpack(vim.api.nvim_win_get_cursor(0))
		return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
	end

	local luasnip = require("luasnip")
	return {
		-- 出现补全
		["<A-.>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
		-- 取消
		["<A-,>"] = cmp.mapping({
			i = cmp.mapping.abort(),
			c = cmp.mapping.close(),
		}),
		-- 上一个
		-- ["<C-k>"] = cmp.mapping.select_prev_item(),
		-- 下一个
		-- ["<C-j>"] = cmp.mapping.select_next_item(),
		["<Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			elseif luasnip.expand_or_jumpable() then
				luasnip.expand_or_jump()
			elseif has_words_before() then
				cmp.complete()
			else
				fallback()
			end
		end, { "i", "s" }),

		["<S-Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			elseif luasnip.jumpable(-1) then
				luasnip.jump(-1)
			else
				fallback()
			end
		end, { "i", "s" }),
		-- 确认
		["<CR>"] = cmp.mapping.confirm({
			select = false,
			behavior = cmp.ConfirmBehavior.Replace,
		}),
		--  如果窗口内容太多，可以滚动
		["<C-u>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "c" }),
		["<C-d>"] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "c" }),
	}
end

-- 调试
-- 打断点/删除断点
-- map("n", "<F9>", "<cmd>lua require('dap').toggle_breakpoint();<CR>", opt)
map("n", "<F9>", "<cmd>DapToggleBreakpoint<CR>", opt)
-- 清空断点
-- map("n", "<S-F9>", "<cmd>lua require('dap').repl.clear();<CR>", opt)
map("n", "<S-F9>", "<cmd>DapClearBreakpoints<CR>", opt)
-- 运行代码到断点处
-- map("n", "<F5>", "<cmd>lua require('dap').continue();<CR>", opt)
map("n", "<F5>", "<cmd>DapContinue<CR>", opt)
-- 结束运行
-- map("n", "<S-F5>", "<cmd>lua require('dap').stop();<CR>", opt)
map("n", "<S-F5>", "<cmd>DapStop<CR>", opt)
-- 步过
-- map("n", "<F10>", "<cmd>lua require('dap').step_over();<CR>", opt)
map("n", "<F10>", "<cmd>DapStepOver<CR>", opt)
-- 步入
-- map("n", "<F11>", "<cmd>lua require('dap').step_into();<CR>", opt)
map("n", "<F11>", "<cmd>DapStepInto<CR>", opt)
-- 运行代码到光标处
-- map("n", "<F12>", "<cmd>lua require('dap').run_to_cursor();<CR>", opt)
map("n", "<F12>", "<cmd>DapRunToCursor<CR>", opt)
-- 步出
-- map("n", "<S-F11>", "<cmd>lua require('dap').step_out();<CR>", opt)
map("n", "<S-F11>", "<cmd>DapStepOut<CR>", opt)
-- 结束调试
--map("n", "<F8>", "<cmd>lua require('dap').terminal();<CR>", opt)
map("n", "<F8>", "<cmd>DapTerminal<CR>", opt)

return pluginKeys
