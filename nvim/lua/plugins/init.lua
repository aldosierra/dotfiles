return require('packer').startup(function(use)
  -- Packer
  use 'wbthomason/packer.nvim'
  -- Tokyonight Theme
  use {'folke/tokyonight.nvim', config = "require('tokyonight-config')"}
  -- Nvim Treesitter
  use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate', event = 'BufWinEnter', config = "require('treesitter-config')"}
  -- Lualine
  use {'nvim-lualine/lualine.nvim', requires = {'kyazdani42/nvim-web-devicons', opt = true}, event = "BufWinEnter", config = "require('lualine-config')"}
  -- Bufferline
  use {'akinsho/bufferline.nvim', requires = 'kyazdani42/nvim-web-devicons', event = "BufWinEnter", config = "require('bufferline-config')"}
  -- Nvim Tree
  use {'kyazdani42/nvim-tree.lua', requires = 'kyazdani42/nvim-web-devicons', cmd = "NvimTreeToggle", config = "require('tree-config')"}
  -- Autotag
  use {'windwp/nvim-ts-autotag', event = "InsertEnter", after = "nvim-treesitter"}
  -- Rainbow
  use {'p00f/nvim-ts-rainbow', after = "nvim-treesitter"}
  -- Toggle Term
  use {'akinsho/toggleterm.nvim', config = "require('toggleterm-config')"}
  -- Autopair
  use {'windwp/nvim-autopairs', config = "require('autopairs-config')", after = "nvim-cmp"}
  -- Which Key
  use {'folke/which-key.nvim', event = "BufWinEnter", config = "require('whichkey-config')"}
  -- Telescope (need sudo pacman -S ripgrep)
  use {'nvim-telescope/telescope.nvim', requires = {'nvim-lua/plenary.nvim'}, cmd = "Telescope", config = "require('telescope-config')"}
  -- Autocompletions
  use {'neovim/nvim-lspconfig', config = "require('lsp')"}
  use {'hrsh7th/cmp-nvim-lsp'}
  use {'hrsh7th/cmp-buffer'}
  use {'hrsh7th/cmp-path'}
  use {'hrsh7th/cmp-cmdline'}
  use {'hrsh7th/cmp-nvim-lua'}
  use {'hrsh7th/nvim-cmp'}
  use {'hrsh7th/cmp-vsnip'}
  use {'hrsh7th/vim-vsnip'}
  use {'onsails/lspkind-nvim'}
  -- Colors
  use {'norcalli/nvim-colorizer.lua', event = "BufRead", config = "require('colorizer-config')"}
  -- Comments
  use {'terrortylor/nvim-comment', cmd = "CommentToggle", config = "require('comment-config')"}
  -- Format on Save
  use {'lukas-reineke/format.nvim', cmd = "Format", config = "require('format-config')"}
  -- Gitsigns
  use {'lewis6991/gitsigns.nvim', requires = {'nvim-lua/plenary.nvim'}, config = "require('gitsigns').setup {current_line_blame = false}"}
  -- Dashboard
  use {'glepnir/dashboard-nvim', cmd = "Dashboard", config = "require('dashboard-config')"}
end)
