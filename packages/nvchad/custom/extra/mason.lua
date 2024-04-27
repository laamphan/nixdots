local M = {
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        -- No need if use NixOS
        -- Nix
        -- "nil",
        -- rust 
        -- "rust-analyzer",
        -- go
        -- "gopls",
        -- TS / JS
        -- "biome",

        -- TS / JS
        "typescript-language-server",
        "eslint-lsp",
        "prettierd",
        "prettier",
        "eslint_d",
        -- "biome",
        -- Astro
        "astro-language-server",
        -- Lua
        "lua-language-server",
        "stylua",
        -- Bash
        "bash-language-server",
        "shellcheck",
        -- YAML
        "yaml-language-server",
        -- Cucumber
        "cucumber-language-server",
        -- HTML CSS
        "css-lsp",
        "html-lsp",
        "tailwindcss-language-server",
        -- Apex 
        "apex-language-server",
        -- markdown
        "md",
        "mdx",
      },
    },
  },
}

return M
