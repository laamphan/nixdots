-- custom/configs/null-ls.lua

local null_ls = require "null-ls"
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics

local sources = {
  formatting.stylua,
  formatting.prettierd,
  -- formatting.prettier_eslint,
  diagnostics.shellcheck,
  formatting.alejandra,
  formatting.prettier.with({
    filetypes = { "apex" },
    extra_args = { "--plugin=prettier-plugin-apex", "--write" },
  })
}

null_ls.setup {
  debug = true,
  sources = sources,
  on_attach = function(client, bufnr)
    if client.supports_method "textDocument/formatting" then
      vim.api.nvim_clear_autocmds { group = augroup, buffer = bufnr }
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup,
        buffer = bufnr,

        callback = function()
          vim.lsp.buf.format { async = false }
        end,
      })
    end
  end,
}
