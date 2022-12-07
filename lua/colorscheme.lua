local colorscheme = "tokyonight"
local ret = {}
local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  vim.notify("colorscheme " .. colorscheme .. "启用失败！")
  return
end
ret.curScheme = colorscheme
return ret
