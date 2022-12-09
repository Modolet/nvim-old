local status ,fterm = pcall(require,"FTerm")
if not status then
  vim.notify("未找到 FTerm")
  return
end

fterm.setup({
  border = "double",
  dimensions = {
    height = 0.9,
    width = 0.9,
  },
  auto_close = true,
})

