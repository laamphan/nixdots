local configs = require("plugins.configs.lspconfig")
local on_attach = configs.on_attach
local capabilities = configs.capabilities

local lspconfig = require("lspconfig")

lspconfig.tsserver.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	init_options = {
		preferences = {
			importModuleSpecifierPreference = "non-relative",
		},
		server_capabilities = { documentFormattingProvider = false },
	},
})

-- lspconfig.eslint.setup({
-- 	capabilities = capabilities,
-- 	on_attach = on_attach,
-- })

lspconfig.gopls.setup({
	capabilities = capabilities,
	on_attach = on_attach,
	cmd = { "gopls" },
	filetypes = { "go", "gomod", "gowork", "gotmpl" },
	rootdir = lspconfig.util.root_pattern("go.work", "go.mod", ".git"),

	settings = {
		gopls = {
			completeUnimported = true,
			-- usePlaceholders = true,
			analyses = {
				unusedparams = true,
				shadow = true,
			},
		},
	},
})
lspconfig.biome.setup({
	capabilities = capabilities,
	on_attach = on_attach,
})

lspconfig.lua_ls.setup({
	capabilities = capabilities,
	on_attach = on_attach,
})

lspconfig.apex_ls.setup({
	apex_jar_path = "/home/binh1298/.local/share/nvim/mason/packages/apex-language-server/extension/dist/apex-jorje-lsp.jar",
	capabilities = capabilities,
	on_attach = on_attach,
	filetypes = { "apexcode", "apex", "visualforce" },
})

lspconfig.tailwindcss.setup({
	capabilities = capabilities,
	on_attach = on_attach,
})
