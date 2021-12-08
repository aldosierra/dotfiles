-- Setup lspconfig.
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
-- Emmet Config (needs npm install -g ls_emmet)
require'lspconfig.configs'.ls_emmet = {
  default_config = {
    cmd = {'ls_emmet', '--stdio'},
    filetypes = {
      'html', 'css', 'scss', 'javascript', 'javascriptreact', 'typescript', 'typescriptreact', 'haml', 'xml', 'xsl', 'pug', 'slim', 'sass', 'stylus',
      'less', 'sss'
    },
    root_dir = function(_)
      return vim.loop.cwd()
    end,
    settings = {}
  }
}
local langservers = {'html', 'cssls', 'tsserver', 'pyright', 'ls_emmet'}
-- Require their respective language server
for _, server in ipairs(langservers) do require('lspconfig')[server].setup {capabilities = capabilities} end
-- Lua Language Server
local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")
require'lspconfig'.sumneko_lua.setup {
  settings = {
    Lua = {
      runtime = {version = 'LuaJIT', path = runtime_path},
      diagnostics = {globals = {'vim'}},
      workspace = {library = vim.api.nvim_get_runtime_file("", true), checkThirdParty = false},
      telemetry = {enable = false}
    }
  }
}
