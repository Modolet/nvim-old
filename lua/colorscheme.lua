-- local colorscheme = "tokyonight"
local colorscheme = "catppuccin"

local status, cat = pcall(require, "catppuccin")
if not status then
	print("未找到 catppuccin")
end

cat.setup({
	flavour = "mocha", -- latte, frappe, macchiato, mocha
	background = { -- :h background
		light = "latte",
		dark = "mocha",
	},
	transparent_background = true,
	term_colors = false,
	dim_inactive = {
		enabled = false,
		shade = "dark",
		percentage = 0.15,
	},
	no_italic = false, -- Force no italic
	no_bold = false, -- Force no bold
	styles = {
		comments = { "italic" },
		conditionals = { "italic" },
		loops = {},
		functions = {},
		keywords = {},
		strings = {},
		variables = {},
		numbers = {},
		booleans = {},
		properties = {},
		types = {},
		operators = {},
	},
	color_overrides = {},
	custom_highlights = {},
	integrations = {
		cmp = true,
		gitsigns = true,
		nvimtree = true,
		telescope = true,
		notify = false,
		mini = false,
		-- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
	},
})

require("tokyonight").setup({
	transparent = true,
})

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
	vim.notify("colorscheme " .. colorscheme .. "启用失败！")
	return
end

local enableTrans = false
if enableTrans then
	vim.g.transparent_enabled = true
	vim.g.tokyonight_transparent = vim.g.transparent_enabled

	local trans
	status_ok, trans = pcall(require, "transparent")
	if not status_ok then
		vim.notify("未找到 transparent")
		return
	end

	local trans_setup = {
		enable = true, -- boolean: enable transparent
		extra_groups = { -- table/string: additional groups that should be cleared
			-- In particular, when you set it to 'all', that means all available groups

			-- example of akinsho/nvim-bufferline.lua
			"BufferLineTabClose",
			"BufferlineBufferSelected",
			"BufferLineFill",
			"BufferLineBackground",
			"BufferLineSeparator",
			"BufferLineIndicatorSelected",
		},
		exclude = {}, -- table: groups you don't want to clear
	}

	trans.setup(trans_setup)
end
