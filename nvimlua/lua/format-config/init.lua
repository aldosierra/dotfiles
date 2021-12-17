require'format'.setup {
  -- All of these needs sudo yarn global add prettier
  html = {{cmd = {"prettier -w"}}},
  css = {{cmd = {"prettier -w"}}},
  json = {{cmd = {"prettier -w"}}},
  yaml = {{cmd = {"prettier -w"}}},
  javascript = {{cmd = {"prettier -w", "./node_modules/.bin/eslint --fix"}}},
  javascriptreact = {{cmd = {"prettier -w", "./node_modules/.bin/eslint --fix"}}},
  typescript = {{cmd = {"prettier -w", "./node_modules/.bin/eslint --fix"}}},
  typescriptreact = {{cmd = {"prettier -w", "./node_modules/.bin/eslint --fix"}}},
  -- Lua Needs sudo pacman -S luarocks && sudo luarocks install --server=https://luarocks.org/dev luaformatter
  -- lua = {
  --   {
  --     cmd = {
  --       function(file)
  --         return string.format(
  --                    'lua-format -i --no-keep-simple-function-one-line --no-break-after-operator --column-limit=150 --break-after-table-lb --indent-width=2 %s',
  --                    file)
  --       end
  --     }
  --   }
  -- },
  -- Python needs sudo pacman -S python-black
  python = {
    {
      cmd = {
        function(file)
          return string.format('black --quiet %s', file)
        end
      }
    }
  }
}
vim.cmd('autocmd BufWritePost * FormatWrite')
