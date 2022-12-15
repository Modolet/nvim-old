vim.api.nvim_create_autocmd({
	"WinScrolled",
	"BufWinEnter",
	"CursorMoved",
	"InsertLeave",
	"BufWritePost",
	"TextChanged",
	"TextChangedI",
	-- add more events here
}, {
	group = vim.api.nvim_create_augroup("barbecue", {}),
	callback = function()
		require("barbecue.ui").update()

		-- maybe a bit more logic here
	end,
})
