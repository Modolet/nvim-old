local status, treesitter = pcall(require,"nvim-treesitter.configs")
if not status then
  vim.notify("未找到 nvim-treesitter")
  return
end


local list_keys = require("keybindings").treesitter

treesitter.setup({
  -- 安装 language parser
  -- :TSInstallInfo 命令查看支持的语言
  -- ensure_installed = { "json", "html", "css", "vim", "lua", "c", "c++",  },
  -- 启用代码高亮模块
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
  incremental_selection = {
    enable = true,
    keymaps = list_keys
  },
  indent = {
    enable = true,
  }
})


-- 开启 Folding 代码折叠模块
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
-- 默认不折叠
vim.opt.foldlevel = 99
