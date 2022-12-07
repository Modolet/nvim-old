vim.g.mapleader = " "
vim.g.maplocalleader = " "

local map = vim.api.nvim_set_keymap
local opt = {noremap = true, silent = true}

-- 取消原本S键的功能
map("n","s","",opt)

-- 分屏快捷键
map("n","sv",":vsp<CR>",opt) -- 横向分屏
map("n","sh",":sp<CR>",opt) -- 纵向分屏
map("n","sc","<C-w>c",opt) -- 关闭当前
map("n","so","<C-w>o",opt) -- 关闭其他
-- 跳转
map("n","<A-h>","<C-w>h",opt)
map("n","<A-j>","<C-w>j",opt)
map("n","<A-k>","<C-w>k",opt)
map("n","<A-l>","<C-w>l",opt)
-- 左右比例控制
map("n", "<C-Left>",":vertical resize -2<CR>",opt)
map("n", "<C-Right>",":vertical resize +2<CR>",opt)
-- 上下比例控制
map("n", "<C-Up>",":resize +2<CR>",opt)
map("n", "<C-Down>",":resize -2<CR>",opt)
-- 等比例
map("n","s=","<C-w>=",opt)

-- Terminal相关
map("n","th",":sp | terminal<CR>",opt)
map("n","tv",":vsp | terminal<CR>",opt)
map("t","<Esc>","<C-\\><C-n>",opt)
map("n","<A-h>",[[ <C-\><C-N><C-w>h ]],opt)
map("n","<A-j>",[[ <C-\><C-N><C-w>j ]],opt)
map("n","<A-k>",[[ <C-\><C-N><C-w>k ]],opt)
map("n","<A-l>",[[ <C-\><C-N><C-w>l ]],opt)

-- 代码移动
-- 上下滚动浏览
map("n", "<C-j>", "4j", opt)
map("n", "<C-k>", "4k", opt)
-- ctrl u / ctrl + d  只移动9行，默认移动半屏
map("n", "<C-u>", "9k", opt)
map("n", "<C-d>", "9j", opt)

-- visual模式配置
-- 缩进代码
map("v",">",">gv",opt)
map("v","<","<gv",opt)
-- 上下移动选中文本
map("v", "J", ":move '>+1<CR>gv-gv", opt)
map("v", "K", ":move '<-2<CR>gv-gv", opt)

-- 保存、退出
map("n","Q",":q<CR>",opt)
map("n","QQ",":q!<CR>",opt)
map("n","QQQ",":qa!<CR>",opt)
map("n","S",":w<CR>",opt)

-- 插件快捷键
local pluginKeys = {}

-- nvim-tree
map("n","<Leader>f",":NvimTreeToggle<CR>",opt)
pluginKeys.nvimTree = {
-- 打开文件或文件夹
  { key = {"<CR>", "o", "<2-LeftMouse>"}, action = "edit" },
  -- 分屏打开文件
  { key = "v", action = "vsplit" },
  { key = "h", action = "split" },
  -- 显示隐藏文件
  { key = "i", action = "toggle_custom" }, -- 对应 filters 中的 custom (node_modules)
  { key = ".", action = "toggle_dotfiles" }, -- Hide (dotfiles)
  -- 文件操作
  { key = {"<F5>","r"}, action = "refresh" },
  { key = "a", action = "create" },
  { key = "d", action = "remove" },
  { key = "r", action = "rename" },
  { key = "x", action = "cut" },
  { key = "c", action = "copy" },
  { key = "p", action = "paste" },
  { key = "s", action = "system_open" },
}
return pluginKeys
