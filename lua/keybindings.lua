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
map("n","eh","<C-w>h",opt)
map("n","ej","<C-w>j",opt)
map("n","ek","<C-w>k",opt)
map("n","el","<C-w>l",opt)
-- 左右比例控制
map("n", "<C-Left>",":vertical resize -2<CR>",opt)
map("n", "<C-Right>",":vertical resize +2<CR>",opt)
-- 上下比例控制
map("n", "<C-Up>",":resize +2<CR>",opt)
map("n", "<C-Down>",":resize -2<CR>",opt)
-- 等比例
map("n","s=","<C-w>=",opt)

-- Terminal相关
map("n","<Leader>th",":sp | terminal<CR>",opt)
map("n","<Leader>tv",":vsp | terminal<CR>",opt)
map("t","<Esc>","<C-\\><C-n>",opt)
map("n","eh",[[ <C-\><C-N><C-w>h ]],opt)
map("n","ej",[[ <C-\><C-N><C-w>j ]],opt)
map("n","ek",[[ <C-\><C-N><C-w>k ]],opt)
map("n","el",[[ <C-\><C-N><C-w>l ]],opt)

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
map("n","<C-q>",":q<CR>",opt)
map("n","<C-a><C-q>",":qa<CR>",opt)
map("n","<C-s>",":w<CR>",opt)
map("n","<C-a><C-s>",":wa<CR>",opt)

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

-- bufferline
-- 新建
map("n","Tn",":tabnew<CR>",opt)
-- 左右TAB切换
map("n","Tl",":BufferLineCycleNext<CR>",opt)
map("n","Th",":BufferLineCyclePrev<CR>",opt)
-- 关闭
map("n","Tcc",":BDelete<CR>",opt) -- 关闭一个
map("n","Tcl",":BufferLineCoseLeft<CR>",opt) -- 关闭左边
map("n","Tcr",":BufferLineCoseRight<CR>",opt) -- 关闭右边
map("n","Tca",":BufferLinePickClose<CR>",opt) -- 关闭所有



return pluginKeys
