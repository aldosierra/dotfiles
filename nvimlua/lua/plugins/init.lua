return require('packer').startup(function(use)
  -- Packer
  use 'wbthomason/packer.nvim'
  -- Tokyonight Theme
  use {'folke/tokyonight.nvim'}
  -- Nvim Treesitter
  use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
  -- Lualine
  use {'nvim-lualine/lualine.nvim', requires = {'kyazdani42/nvim-web-devicons', opt = true}}
  -- Bufferline
  use {'akinsho/bufferline.nvim', requires = 'kyazdani42/nvim-web-devicons'}
  -- Nvim Tree
  use {'kyazdani42/nvim-tree.lua', requires = 'kyazdani42/nvim-web-devicons'}
  -- Autotag
  use {'windwp/nvim-ts-autotag'}
  -- Rainbow
  use {'p00f/nvim-ts-rainbow'}
  -- Toggle Term
  use {'akinsho/toggleterm.nvim'}
  -- Autopair
  use {'windwp/nvim-autopairs'}
  -- Which Key
  use {'folke/which-key.nvim'}
  -- Telescope (need sudo pacman -S ripgrep)
  use {'nvim-telescope/telescope.nvim', requires = {'nvim-lua/plenary.nvim'}}
  -- Autocompletions
  use {'neovim/nvim-lspconfig'}
  use {'hrsh7th/cmp-nvim-lsp'}
  use {'hrsh7th/cmp-path'}
  use {'hrsh7th/cmp-buffer'}
  use {'hrsh7th/cmp-cmdline'}
  use {'hrsh7th/cmp-nvim-lua'}
  use {'hrsh7th/nvim-cmp'}
  use {'hrsh7th/cmp-vsnip'}
  use {'hrsh7th/vim-vsnip'}
  use {'onsails/lspkind-nvim'}
  -- Colors
  use {'norcalli/nvim-colorizer.lua'}
  -- Comments
  use {'terrortylor/nvim-comment'}
  -- Format on Save
  use {'lukas-reineke/format.nvim'}
  -- Gitsigns
  use {'lewis6991/gitsigns.nvim', requires = {'nvim-lua/plenary.nvim'}}
  -- Dashboard
  use {'glepnir/dashboard-nvim'}
end)
