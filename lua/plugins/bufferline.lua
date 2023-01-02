local status, bufferline = pcall(require, "bufferline")
if not status then
	vim.notify("未找到 bufferline")
end

bufferline.setup({
	options = {
		-- 关闭Tab的命令 使用moll/vim-bbye的:Bdelete命令 不会打乱布局
		close_command = "BDelete! %d",
		right_mouse_command = "BDelete! %d",
		-- 侧边栏配置
		-- 左侧让出nvim-tree的位置,显示文字File Explorer
		offsets = {
			{
				filetype = "NvimTree",
				text = "File Explorer",
				highlight = "Directory",
				text_align = "left",
			},
		},
		-- 使用nvim内置LSP
		diagnostics = "nvim_lsp",
		giagnostics_indicator = function(count, level, diagnostics_dict, context)
			local s = " "
			for e, n in pairs(diagnostics_dict) do
				local sym = e == "error" and " " or (e == "warning" and " " or "")
				s = s .. n .. sym
			end
			return s
		end,
	},
})
