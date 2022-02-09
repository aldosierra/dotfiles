-- Treesitter config
require'nvim-treesitter.configs'.setup {
  ensure_installed = {"c", "lua", "python", "html", "javascript", "cpp", "css"},
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
}
