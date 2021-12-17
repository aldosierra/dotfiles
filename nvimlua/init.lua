-- Nvim Config
-- Call Plugins
require('plugins')
-- Call Options
require('options')
-- Call Keybindings
require('keybindings')
-- Call Tokyonight Them
require('tokyonight-config')
-- Call Nvim Treesitter
require('treesitter-config')
-- Call Lualine
require('lualine-config')
-- Call Bufferline
require('bufferline-config')
-- Call Nvim Tree
require('tree-config')
-- Call LSP
require('lsp')
-- Call Autopairs
require('autopairs-config')
-- Call Telescope
require('telescope-config')
-- Call Comments
require('comment-config')
-- Call Format
require('format-config')
-- Call ToggleTerm
require('toggleterm-config')
-- Call Whichkey
require('whichkey-config')
-- Call Dashboard
require('dashboard-config')
-- Call Colorizer
require('colorizer-config')
-- Call Gitsigns
require('gitsigns').setup {current_line_blame = false}
