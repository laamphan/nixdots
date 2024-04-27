local M = {
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
}

return M
