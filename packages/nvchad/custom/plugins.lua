local overrides = require "custom.configs.overrides"

local plugins = {
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        -- TS / JS
        "typescript-language-server",
        "eslint-lsp",
        "prettierd",
        "prettier",
        "eslint_d",
        "biome",
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
        -- Nix
        "nil",
        -- Apex 
        "apex-language-server",
        -- markdown
        "md",
        "mdx",
        -- rust 
        "rust-analyzer",
      },
    },
  },
  {
    "neovim/nvim-lspconfig",

    dependencies = {
      "nvimtools/none-ls.nvim",
      event = "VeryLazy",
      config = function()
        require "custom.configs.null-ls"
      end,
    },

    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "apex",
        "bash",
        "html",
        "css",
        "javascript",
        "typescript",
        "json",
        "lua",
        "luadoc",
        "luap",
        "markdown",
        "markdown_inline",
        "python",
        "query",
        "regex",
        "tsx",
        "yaml",
        "astro",
        "go",
        "nix",
      },
    },
  },

  { "christoomey/vim-tmux-navigator", lazy = false },
  { "mechatroner/rainbow_csv" },
  {
    "lewis6991/gitsigns.nvim",
    opts = {
      current_line_blame = true,
    },
  },
  {
    "NvChad/nvim-colorizer.lua",
    opts = {
      user_default_options = {
        tailwind = true,
      },
    },
  },
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      { "roobert/tailwindcss-colorizer-cmp.nvim", config = true },
    },
    opts = function(_, opts)
      -- taiwind
      -- original LazyVim kind icon formatter
      local format_kinds = opts.formatting.format
      opts.formatting.format = function(entry, item)
        format_kinds(entry, item) -- add icons
        return require("tailwindcss-colorizer-cmp").formatter(entry, item)
      end
      -- conflict with copilot
      opts.mapping["<Tab>"] = nil
      opts.mapping["S-<Tab>"] = nil

      -- rust 
      local M = require "plugins.configs.cmp"
      table.insert(M.sources, {name = "crates"})
      return M
    end,
  },
  {
    "princejoogie/dir-telescope.nvim",
    -- telescope.nvim is a required dependency
    dependencies = { "nvim-telescope/telescope.nvim" },
    opts = {
      -- these are the default options set
      hidden = true,
      no_ignore = false,
      show_preview = true,
    },
  },
  {
    "github/copilot.vim",
    event = "InsertEnter"
  },
  -- {
  --   "zbirenbaum/copilot.lua",
  --   cmd = "Copilot",
  --   event = "",
  --   config = function()
  --     require("copilot").setup({})
  --   end,
  -- },

  {
    "hrsh7th/nvim-cmp",
    -- dependencies = {
    --   {
    --     "zbirenbaum/copilot-cmp",
    --     config = function()
    --       require("copilot_cmp").setup()
    --     end,
    --   },
    -- },
    opts = {
      sources = {
        { name = "nvim_lsp", group_index = 2 },
        -- { name = "copilot", group_index = 2 },
        { name = "luasnip", group_index = 2 },
        { name = "buffer", group_index = 2 },
        { name = "nvim_lua", group_index = 2 },
        { name = "path", group_index = 2 },
      },
    },
  },
  {
    "windwp/nvim-ts-autotag",
    ft = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
    config = function()
      require("nvim-ts-autotag").setup()
    end,
  },
  {
    "3rd/image.nvim",
    config = function()
      require("image").setup()
    end,
  },
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "3rd/image.nvim" },
  },

  {
    'mrcjkb/rustaceanvim',
    version = '^4', -- Recommended
    lazy = false, -- This plugin is already lazy
  },
  {
    "rust-lang/rust.vim", 
    ft= "rust",
    init = function () 
      vim.g.rustfmt_autosave = 1
    end
  },
  {
    "saecki/crates.nvim",
    ft = {"rust", "toml"},
    config = function(_, opts) 
      local crates = require("crates")
      crates.setup(opts)
      crates.show()
    end,
  }
}
vim.g.copilot_assume_mapped = true
vim.filetype = on

vim.filetype.add({
  extension = {
    cls = 'apex',
    apex = 'apex',
    trigger = 'apex',
    soql = 'soql',
    sosl = 'sosl',
    mdx = 'markdown',

  }
})
vim.wo.relativenumber = true

return plugins
