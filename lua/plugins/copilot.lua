-- 获取环境变量中的host_ip
local host_ip = os.getenv("host_ip")
vim.g.copilot_proxy = host_ip .. ":6789"
require("copilot_cmp").setup({
    method = "getPanelCompletions",
    formatters = {
        insert_text = require("copilot_cmp.format").remove_existing,
    },
})
