-- Setup lspconfig.
-- local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
-- local runtime_path = vim.split(package.path, ';')
-- local configs = require'lspconfig.configs'
-- table.insert(runtime_path, "lua/?.lua")
-- table.insert(runtime_path, "lua/?/init.lua")
-- if not configs.ls_emmet then
--   configs.ls_emmet = {
--     default_config = {
--       cmd = { 'ls_emmet', '--stdio' };
--       filetypes = { 'html', 'css', 'scss', 'javascript', 'javascriptreact', 'typescript', 'typescriptreact', 'haml',
--         'xml', 'xsl', 'pug', 'slim', 'sass', 'stylus', 'less', 'sss'};
--       root_dir = function(_)
--         return vim.loop.cwd()
--       end;
--       settings = {};
--     };
--   }
-- end
-- -- Set lsp servers var (emmet needs npm install -g ls_emmet)
-- local langservers = {
--   'html',
--   'cssls',
--   'tsserver',
--   'pyright',
--   'ls_emmet',
--   'sumneko_lua',
-- }
-- -- Require their respective language server
-- for _, server in pairs(langservers) do
--   if server == 'sumneko_lua' then
--     require'lspconfig'[server].setup {
--       settings = {
--         Lua = {
--           runtime = {version = 'LuaJIT', path = runtime_path},
--           diagnostics = {globals = {'vim', 'use'}},
--           workspace = {library = vim.api.nvim_get_runtime_file("", true), checkThirdParty = false},
--           telemetry = {enable = false}
--         }
--       },
--       capabilities = capabilities
--     }
--   else
--     require'lspconfig'[server].setup {capabilities = capabilities}
--   end
-- end
local lsp_installer = require('nvim-lsp-installer')

lsp_installer.on_server_ready(function(server)
  local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
  local opts = {capabilities = capabilities}
  if server.name == "sumneko_lua" then
    opts = vim.tbl_deep_extend("force", {
      settings = {
        Lua = {
          runtime = {version = 'LuaJIT', path = vim.split(package.path, ';')},
          diagnostics = {globals = {'vim'}},
          workspace = {library = vim.api.nvim_get_runtime_file("", true), checkThirdParty = false},
          telemetry = {enable = false}
        }
      }

    }, opts)
  end
  server:setup(opts)
end)
