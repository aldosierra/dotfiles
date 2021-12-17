-- Treesitter config
require'nvim-treesitter.configs'.setup {
  ensure_installed = "all",
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
  autotag = {enable = true},
  autopairs = {enable = true},
}
