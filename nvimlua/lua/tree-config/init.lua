vim.g.nvim_tree_width = 25
vim.g.nvim_tree_indent_markers = 1
vim.g.nvim_tree_quit_on_open = 1
require'nvim-tree'.setup {auto_open = true, auto_close = true, git = {ignore = true}}
