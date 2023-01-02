-- 获取环境变量中的host_ip
local host_ip = os.getenv("host_ip")
if host_ip ~= nil then
	vim.g.copilot_proxy = host_ip .. ":6789"
end

require("copilot_cmp").setup({
	method = "getPanelCompletions",
	formatters = {
		insert_text = require("copilot_cmp.format").remove_existing,
	},
})
