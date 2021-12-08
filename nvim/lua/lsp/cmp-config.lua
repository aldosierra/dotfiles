-- Setup nvim-cmp.
vim.g.completeopt = "menu,menuone,noselect,noinsert"
local cmp = require 'cmp'
local lspkind = require('lspkind')

cmp.setup({
  snippet = {
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
    end
  },
  mapping = {
    ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), {'i', 'c'}),
    ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), {'i', 'c'}),
    ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), {'i', 'c'}),
    ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
    ['<C-e>'] = cmp.mapping({i = cmp.mapping.abort(), c = cmp.mapping.close()}),
    ['<Tab>'] = cmp.mapping.confirm({select = true})
  },
  sources = cmp.config.sources({
    {name = 'nvim_lsp'}, {name = 'vsnip'} -- For vsnip users.
  }, {{name = 'buffer'}}),
  formatting = {
    format = lspkind.cmp_format({
      with_text = false,
      menu = ({buffer = "[Buffer]", nvim_lsp = "[LSP]", luasnip = "[LuaSnip]", nvim_lua = "[Lua]", latex_symbols = "[Latex]"}),
      maxwidth = 50,
      before = function(entry, vim_item)
        return vim_item
      end
    })
  }
})

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline('/', {sources = {{name = 'buffer'}}})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {sources = cmp.config.sources({{name = 'path'}}, {{name = 'cmdline'}})})
