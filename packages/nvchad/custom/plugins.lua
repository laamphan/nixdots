local overrides = require "custom.configs.overrides"

local plugins = {
  require "custom.extra.mason",
  require "custom.extra.treesitter",
  require "custom.extra.rust",
  require "custom.extra.others",
  require "custom.extra.go",
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
    "github/copilot.vim",
    event = "InsertEnter"
  },
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
