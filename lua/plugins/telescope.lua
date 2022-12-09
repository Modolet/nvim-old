local status, telescope = pcall(require,"telescope")
if not status then
  vim.notify("未找到 telescope")
  return 
end

telescope.setup({
  defaults = {
    -- 打开窗口默认进入插入模式
    initial_mode = "insert",
    mappings = require("keybindings").telescope,
  },
  pickers ={
    find_files ={
      -- 查找文件换皮肤，支持的参数有： dropdown, cursor, ivy
      -- theme = "dropdown",
    }
  },
  extensions = {
    -- 扩展插件配置
    -- 扩展列表 https://github.com/nvim-telescope/telescope.nvim/wiki/Extensions
  },
})
