-- Plugins
return require('packer').startup(function(use)
  -- Packer
  use 'wbthomason/packer.nvim'
  -- Nvim Treesitter
  use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
  -- Tokyonight Theme
  use 'folke/tokyonight.nvim'
  -- Catppuccin
use({ "catppuccin/nvim", as = "catppuccin" })
  -- Lualine
  use {'nvim-lualine/lualine.nvim', requires = {'kyazdani42/nvim-web-devicons', opt = true}}
  -- Bufferline
  use {'akinsho/bufferline.nvim', requires = 'kyazdani42/nvim-web-devicons'}
  -- Nvim Tree
  use {'kyazdani42/nvim-tree.lua', requires = {'kyazdani42/nvim-web-devicons'}}
  -- Whichkey
  use 'folke/which-key.nvim'
  -- Autopairs
  use 'windwp/nvim-autopairs'
  -- Telescope
  use {'nvim-telescope/telescope.nvim', requires = {'nvim-lua/plenary.nvim'}}
  -- LSP
  use 'neovim/nvim-lspconfig'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/cmp-nvim-lua'
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-vsnip'
  use 'hrsh7th/vim-vsnip'
  use 'onsails/lspkind-nvim'
  use 'williamboman/nvim-lsp-installer'
  -- Colorizer
  use 'norcalli/nvim-colorizer.lua'
  -- Git Signs
  use {'lewis6991/gitsigns.nvim', requires = {'nvim-lua/plenary.nvim'}}
  -- Dashboard
  use 'glepnir/dashboard-nvim'
  -- Toggleterm
  use 'akinsho/toggleterm.nvim'
  -- Comments Toggle
  use 'terrortylor/nvim-comment'
end)
