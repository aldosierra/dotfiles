-- Keybindings Conf
vim.g.mapleader = ' '
local map = vim.api.nvim_set_keymap
-- Vim Keybings for split
map('n', '<C-h>', '<C-w>h', {noremap = true, silent = true})
map('n', '<C-j>', '<C-w>j', {noremap = true, silent = true})
map('n', '<C-k>', '<C-w>k', {noremap = true, silent = true})
map('n', '<C-l>', '<C-w>l', {noremap = true, silent = true})
-- Out of Insert Mode
map('i', 'jk', '<ESC>', {noremap = true, silent = true})
map('i', 'kj', '<ESC>', {noremap = true, silent = true})
-- Nvim Tree Toggle
map('n', '<leader>e', ':NvimTreeToggle<CR>', {noremap = true, silent = true})
-- Keep Selected lines
map('v', '<', '<gv', {noremap = true, silent = true})
map('v', '>', '>gv', {noremap = true, silent = true})
-- Buffer Keymaps
map('n', '<Tab>', ':BufferLineCycleNext<CR>', {noremap = true, silent = true})
map('n', '<S-Tab>', ':BufferLineCyclePrev<CR>', {noremap = true, silent = true})
