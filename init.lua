require('basic')
require('keybindings')
require('plugins')
require('colorscheme')
-- require('settings.nvim-tree')
-- require('settings.bufferline')
-- require('settings.lualine')

for _, file in ipairs(vim.fn.readdir(vim.fn.stdpath('config')..'/lua/plugins', [[v:val =~ '\.lua$']])) do
  require('plugins.'..file:gsub('%.lua$', ''))
end

