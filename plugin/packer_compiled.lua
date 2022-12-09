-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

_G._packer = _G._packer or {}
_G._packer.inside_compile = true

local time
local profile_info
local should_profile = false
if should_profile then
  local hrtime = vim.loop.hrtime
  profile_info = {}
  time = function(chunk, start)
    if start then
      profile_info[chunk] = hrtime()
    else
      profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
    end
  end
else
  time = function(chunk, start) end
end

local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end
  if threshold then
    table.insert(results, '(Only showing plugins that took longer than ' .. threshold .. ' ms ' .. 'to load)')
  end

  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/modolet/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/home/modolet/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/home/modolet/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/home/modolet/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/modolet/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["Fterm.nvim"] = {
    loaded = true,
    path = "/home/modolet/.local/share/nvim/site/pack/packer/start/Fterm.nvim",
    url = "git@github.com:numToStr/Fterm.nvim"
  },
  LuaSnip = {
    loaded = true,
    path = "/home/modolet/.local/share/nvim/site/pack/packer/start/LuaSnip",
    url = "git@github.com:L3MON4D3/LuaSnip"
  },
  ["aerial.nvim"] = {
    loaded = true,
    path = "/home/modolet/.local/share/nvim/site/pack/packer/start/aerial.nvim",
    url = "git@github.com:stevearc/aerial.nvim"
  },
  ["bufferline.nvim"] = {
    loaded = true,
    path = "/home/modolet/.local/share/nvim/site/pack/packer/start/bufferline.nvim",
    url = "git@github.com:akinsho/bufferline.nvim"
  },
  ["ccls.nvim"] = {
    loaded = true,
    path = "/home/modolet/.local/share/nvim/site/pack/packer/start/ccls.nvim",
    url = "git@github.com:ranjithshegde/ccls.nvim"
  },
  ["cmp-buffer"] = {
    loaded = true,
    path = "/home/modolet/.local/share/nvim/site/pack/packer/start/cmp-buffer",
    url = "git@github.com:hrsh7th/cmp-buffer"
  },
  ["cmp-cmdline"] = {
    loaded = true,
    path = "/home/modolet/.local/share/nvim/site/pack/packer/start/cmp-cmdline",
    url = "git@github.com:hrsh7th/cmp-cmdline"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/home/modolet/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp",
    url = "git@github.com:hrsh7th/cmp-nvim-lsp"
  },
  ["cmp-path"] = {
    loaded = true,
    path = "/home/modolet/.local/share/nvim/site/pack/packer/start/cmp-path",
    url = "git@github.com:hrsh7th/cmp-path"
  },
  ["cmp-vsnip"] = {
    loaded = true,
    path = "/home/modolet/.local/share/nvim/site/pack/packer/start/cmp-vsnip",
    url = "git@github.com:hrsh7th/cmp-vsnip"
  },
  ["copilot-cmp"] = {
    config = { "\27LJ\2\n9\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\16copilot_cmp\frequire\0" },
    load_after = {
      ["copilot.lua"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/modolet/.local/share/nvim/site/pack/packer/opt/copilot-cmp",
    url = "git@github.com:zbirenbaum/copilot-cmp"
  },
  ["copilot.lua"] = {
    after = { "copilot-cmp" },
    config = { "\27LJ\2\n5\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\fcopilot\frequire-\1\0\4\0\3\0\0066\0\0\0009\0\1\0003\2\2\0)\3d\0B\0\3\1K\0\1\0\0\rdefer_fn\bvim\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/modolet/.local/share/nvim/site/pack/packer/opt/copilot.lua",
    url = "git@github.com:zbirenbaum/copilot.lua"
  },
  ["dashboard-nvim"] = {
    loaded = true,
    path = "/home/modolet/.local/share/nvim/site/pack/packer/start/dashboard-nvim",
    url = "git@github.com:glepnir/dashboard-nvim"
  },
  ["friendly-snippets"] = {
    loaded = true,
    path = "/home/modolet/.local/share/nvim/site/pack/packer/start/friendly-snippets",
    url = "git@github.com:rafamadriz/friendly-snippets"
  },
  ["gitsigns.nvim"] = {
    loaded = true,
    path = "/home/modolet/.local/share/nvim/site/pack/packer/start/gitsigns.nvim",
    url = "git@github.com:lewis6991/gitsigns.nvim"
  },
  ["gruvbox.nvim"] = {
    loaded = true,
    path = "/home/modolet/.local/share/nvim/site/pack/packer/start/gruvbox.nvim",
    url = "git@github.com:ellisonleao/gruvbox.nvim"
  },
  ["indent-blankline.nvim"] = {
    loaded = true,
    path = "/home/modolet/.local/share/nvim/site/pack/packer/start/indent-blankline.nvim",
    url = "git@github.com:lukas-reineke/indent-blankline.nvim"
  },
  ["lsp_signature.nvim"] = {
    loaded = true,
    path = "/home/modolet/.local/share/nvim/site/pack/packer/start/lsp_signature.nvim",
    url = "git@github.com:ray-x/lsp_signature.nvim"
  },
  ["lspkind-nvim"] = {
    loaded = true,
    path = "/home/modolet/.local/share/nvim/site/pack/packer/start/lspkind-nvim",
    url = "git@github.com:onsails/lspkind-nvim"
  },
  ["lspsaga.nvim"] = {
    loaded = true,
    path = "/home/modolet/.local/share/nvim/site/pack/packer/start/lspsaga.nvim",
    url = "git@github.com:tami5/lspsaga.nvim"
  },
  ["lualine-lsp-progress"] = {
    loaded = true,
    path = "/home/modolet/.local/share/nvim/site/pack/packer/start/lualine-lsp-progress",
    url = "git@github.com:arkav/lualine-lsp-progress"
  },
  ["lualine.nvim"] = {
    loaded = true,
    path = "/home/modolet/.local/share/nvim/site/pack/packer/start/lualine.nvim",
    url = "git@github.com:nvim-lualine/lualine.nvim"
  },
  ["mason-lspconfig.nvim"] = {
    loaded = true,
    path = "/home/modolet/.local/share/nvim/site/pack/packer/start/mason-lspconfig.nvim",
    url = "git@github.com:williamboman/mason-lspconfig.nvim"
  },
  ["mason-nvim-dap.nvim"] = {
    loaded = true,
    path = "/home/modolet/.local/share/nvim/site/pack/packer/start/mason-nvim-dap.nvim",
    url = "git@github.com:jayp0521/mason-nvim-dap.nvim"
  },
  ["mason.nvim"] = {
    loaded = true,
    path = "/home/modolet/.local/share/nvim/site/pack/packer/start/mason.nvim",
    url = "git@github.com:williamboman/mason.nvim"
  },
  ["neodev.nvim"] = {
    loaded = true,
    path = "/home/modolet/.local/share/nvim/site/pack/packer/start/neodev.nvim",
    url = "git@github.com:folke/neodev.nvim"
  },
  ["nightfox.nvim"] = {
    loaded = true,
    path = "/home/modolet/.local/share/nvim/site/pack/packer/start/nightfox.nvim",
    url = "git@github.com:EdenEast/nightfox.nvim"
  },
  ["nord.nvim"] = {
    loaded = true,
    path = "/home/modolet/.local/share/nvim/site/pack/packer/start/nord.nvim",
    url = "git@github.com:shaunsingh/nord.nvim"
  },
  ["null-ls.nvim"] = {
    loaded = true,
    path = "/home/modolet/.local/share/nvim/site/pack/packer/start/null-ls.nvim",
    url = "git@github.com:jose-elias-alvarez/null-ls.nvim"
  },
  ["nvim-autopairs"] = {
    config = { "\27LJ\2\n@\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\19nvim-autopairs\frequire\0" },
    loaded = true,
    path = "/home/modolet/.local/share/nvim/site/pack/packer/start/nvim-autopairs",
    url = "git@github.com:windwp/nvim-autopairs"
  },
  ["nvim-cmp"] = {
    loaded = true,
    path = "/home/modolet/.local/share/nvim/site/pack/packer/start/nvim-cmp",
    url = "git@github.com:hrsh7th/nvim-cmp"
  },
  ["nvim-code-action-menu"] = {
    commands = { "CodeActionMenu" },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/modolet/.local/share/nvim/site/pack/packer/opt/nvim-code-action-menu",
    url = "git@github.com:weilbith/nvim-code-action-menu"
  },
  ["nvim-dap"] = {
    loaded = true,
    path = "/home/modolet/.local/share/nvim/site/pack/packer/start/nvim-dap",
    url = "git@github.com:mfussenegger/nvim-dap"
  },
  ["nvim-dap-ui"] = {
    loaded = true,
    path = "/home/modolet/.local/share/nvim/site/pack/packer/start/nvim-dap-ui",
    url = "git@github.com:rcarriga/nvim-dap-ui"
  },
  ["nvim-dap-virtual-text"] = {
    loaded = true,
    path = "/home/modolet/.local/share/nvim/site/pack/packer/start/nvim-dap-virtual-text",
    url = "git@github.com:theHamsta/nvim-dap-virtual-text"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/home/modolet/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "git@github.com:neovim/nvim-lspconfig"
  },
  ["nvim-notify"] = {
    loaded = true,
    path = "/home/modolet/.local/share/nvim/site/pack/packer/start/nvim-notify",
    url = "git@github.com:rcarriga/nvim-notify"
  },
  ["nvim-surround"] = {
    config = { "\27LJ\2\n?\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\18nvim-surround\frequire\0" },
    loaded = true,
    path = "/home/modolet/.local/share/nvim/site/pack/packer/start/nvim-surround",
    url = "git@github.com:kylechui/nvim-surround"
  },
  ["nvim-transparent"] = {
    loaded = true,
    path = "/home/modolet/.local/share/nvim/site/pack/packer/start/nvim-transparent",
    url = "git@github.com:xiyaowong/nvim-transparent"
  },
  ["nvim-tree.lua"] = {
    loaded = true,
    path = "/home/modolet/.local/share/nvim/site/pack/packer/start/nvim-tree.lua",
    url = "git@github.com:nvim-tree/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    path = "/home/modolet/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "git@github.com:nvim-treesitter/nvim-treesitter"
  },
  ["nvim-web-devicons"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/modolet/.local/share/nvim/site/pack/packer/opt/nvim-web-devicons",
    url = "git@github.com:kyazdani42/nvim-web-devicons"
  },
  ["oceanic-next"] = {
    loaded = true,
    path = "/home/modolet/.local/share/nvim/site/pack/packer/start/oceanic-next",
    url = "git@github.com:mhartington/oceanic-next"
  },
  ["onedark.nvim"] = {
    loaded = true,
    path = "/home/modolet/.local/share/nvim/site/pack/packer/start/onedark.nvim",
    url = "git@github.com:navarasu/onedark.nvim"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/modolet/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "git@github.com:wbthomason/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/modolet/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "git@github.com:nvim-lua/plenary.nvim"
  },
  ["project.nvim"] = {
    loaded = true,
    path = "/home/modolet/.local/share/nvim/site/pack/packer/start/project.nvim",
    url = "git@github.com:ahmedkhalf/project.nvim"
  },
  ["telescope-symbols.nvim"] = {
    loaded = true,
    path = "/home/modolet/.local/share/nvim/site/pack/packer/start/telescope-symbols.nvim",
    url = "git@github.com:nvim-telescope/telescope-symbols.nvim"
  },
  ["telescope.nvim"] = {
    loaded = true,
    path = "/home/modolet/.local/share/nvim/site/pack/packer/start/telescope.nvim",
    url = "git@github.com:nvim-telescope/telescope.nvim"
  },
  ["tokyonight.nvim"] = {
    loaded = true,
    path = "/home/modolet/.local/share/nvim/site/pack/packer/start/tokyonight.nvim",
    url = "git@github.com:folke/tokyonight.nvim"
  },
  ["translate.nvim"] = {
    loaded = true,
    path = "/home/modolet/.local/share/nvim/site/pack/packer/start/translate.nvim",
    url = "git@github.com:uga-rosa/translate.nvim"
  },
  ["vim-bbye"] = {
    loaded = true,
    path = "/home/modolet/.local/share/nvim/site/pack/packer/start/vim-bbye",
    url = "git@github.com:moll/vim-bbye"
  },
  ["vim-visual-multi"] = {
    loaded = true,
    path = "/home/modolet/.local/share/nvim/site/pack/packer/start/vim-visual-multi",
    url = "git@github.com:mg979/vim-visual-multi"
  },
  ["vim-vsnip"] = {
    loaded = true,
    path = "/home/modolet/.local/share/nvim/site/pack/packer/start/vim-vsnip",
    url = "git@github.com:hrsh7th/vim-vsnip"
  },
  ["which-key.nvim"] = {
    loaded = true,
    path = "/home/modolet/.local/share/nvim/site/pack/packer/start/which-key.nvim",
    url = "git@github.com:folke/which-key.nvim"
  },
  ["zephyr-nvim"] = {
    loaded = true,
    path = "/home/modolet/.local/share/nvim/site/pack/packer/start/zephyr-nvim",
    url = "git@github.com:glepnir/zephyr-nvim"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: nvim-autopairs
time([[Config for nvim-autopairs]], true)
try_loadstring("\27LJ\2\n@\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\19nvim-autopairs\frequire\0", "config", "nvim-autopairs")
time([[Config for nvim-autopairs]], false)
-- Config for: nvim-surround
time([[Config for nvim-surround]], true)
try_loadstring("\27LJ\2\n?\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\18nvim-surround\frequire\0", "config", "nvim-surround")
time([[Config for nvim-surround]], false)

-- Command lazy-loads
time([[Defining lazy-load commands]], true)
pcall(vim.api.nvim_create_user_command, 'CodeActionMenu', function(cmdargs)
          require('packer.load')({'nvim-code-action-menu'}, { cmd = 'CodeActionMenu', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'nvim-code-action-menu'}, { cmd = 'CodeActionMenu' }, _G.packer_plugins)
          return vim.fn.getcompletion('CodeActionMenu ', 'cmdline')
      end})
time([[Defining lazy-load commands]], false)

vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Event lazy-loads
time([[Defining lazy-load event autocommands]], true)
vim.cmd [[au VimEnter * ++once lua require("packer.load")({'copilot.lua'}, { event = "VimEnter *" }, _G.packer_plugins)]]
time([[Defining lazy-load event autocommands]], false)
vim.cmd("augroup END")

_G._packer.inside_compile = false
if _G._packer.needs_bufread == true then
  vim.cmd("doautocmd BufRead")
end
_G._packer.needs_bufread = false

if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
