local configs = require "plugins.configs.lspconfig"
local on_attach = configs.on_attach
local capabilities = configs.capabilities

local lspconfig = require "lspconfig"

lspconfig.tsserver.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  init_options = {
    preferences = {
      importModuleSpecifierPreference = "non-relative",
    },
  },
}

lspconfig.eslint.setup {
  capabilities = capabilities,
  on_attach = on_attach,
}

lspconfig.biome.setup {
  capabilities = capabilities,
  on_attach = on_attach,
}

-- lspconfig.nil.setup {
--   capabilities = capabilities,
--   on_attach = on_attach,
-- }


-- lspconfig.tailwindcss.setup {
--   capabilities = capabilities,
--   on_attach = on_attach,
-- }