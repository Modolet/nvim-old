local status, notify = pcall(require, "notify")
if not status then
	vim.notify("未找到 nvim-notify")
	return
end

local bypassmsg = {
	"method textDocument/codeAction is not supported by any of the servers registered for the current buffer",
	"warning: multiple different client offset_encodings",
}

notify.setup({
	background_colour = "#000000",
})

if not Org_notify then
	Org_notify = notify.notify
end

notify.notify = function(msg, ...)
	for i = 1, #bypassmsg do
		if msg:match(bypassmsg[i]) then
			return
		end
	end
	Org_notify(msg, ...)
end
