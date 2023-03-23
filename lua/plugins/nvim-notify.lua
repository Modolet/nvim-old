local status, notify = pcall(require, "notify")
if not status then
	vim.notify("未找到 nvim-notify")
	return
end

local old_notify = notify.notify

notify.setup({
	background_colour = "#000000",
})

notify.notify = function(msg, ...)
	if msg:match("warning: multiple different client offset_encodings") then
		return
	end
	old_notify(msg, ...)
end

-- vim.notify = function(msg, ...)
-- 	if msg:match("warning: multiple different client offset_encodings") then
-- 		return
-- 	end
-- 	notify(msg, ...)
-- end
