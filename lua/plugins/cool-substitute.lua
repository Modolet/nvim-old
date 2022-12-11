local status, cs = pcall(require, "cool-substitute")
if not status then
	vim.notify("未找到 cool-substitute")
	return
end

local opts = {
	setup_keybindings = true,
}

cs.setup(opts)
