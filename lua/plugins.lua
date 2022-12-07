local packer = require("packer")
packer.startup({
  -- 插件
  function(use)
    -- Packer可以管理自身
    use 'wbthomason/packer.nvim'
    -- 自己的插件列表
    -- 主题
    -- -- 看腻了就去这里找 https://github.com/topics/neovim-colorscheme
    use("folke/tokyonight.nvim") -- tokyonight主题
    use("mhartington/oceanic-next") -- nceanicNext主题
    use("ellisonleao/gruvbox.nvim") -- gruvBox的lua版本
    use("glepnir/zephyr-nvim") -- 挺好看的
    use("shaunsingh/nord.nvim") -- 很现代化 但是比较素
    use("navarasu/onedark.nvim") -- oneDark 可以说很经典了..
    use("EdenEast/nightfox.nvim") -- 一个插件包含多种配色 Nightfox / Nordfox / Dayfox / Dawnfox / Duskfox，支持非常多的第三方插件。
    
    -- 文件树
    use{
      'nvim-tree/nvim-tree.lua',
      requires = {'nvim-tree/nvim-web-devicons'}, -- optional, for file icons
      tag = 'nightly'

    }

  end,

  -- 配置
  config = {
    max_jobs = 16,
    display = {
        open_fn = function()
            return require("packer.util").float({ border = "single" })
        end,
    },
  },
}

)

-- 每次保存 plugins.lua 自动安装插件
pcall(
  vim.cmd,
  [[
    augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
    augroup end
  ]]
)
