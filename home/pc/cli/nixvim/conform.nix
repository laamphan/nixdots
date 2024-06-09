{pkgs, ...}: {
  # home.packages = with pkgs; [];

  programs.nixvim = {
    plugins.conform-nvim = {
      enable = true;
      formatOnSave = {
        timeoutMs = 500;
        lspFallback = true;
      };
      formattersByFt = {
        lua = ["stylua"];
        # Conform will run multiple formatters sequentially
        python = ["isort" "black"];
        # Use a sub-list to run only the first available formatter
        javascript = [["biome-check" "prettierd" "prettier"]];
        typescript = [["biome-check" "prettierd" "prettier"]];
        tsx = [["biome-check" "prettierd" "prettier"]];
        jsx = [["biome-check" "prettierd" "prettier"]];
        typescriptreact = [["biome-check" "prettierd" "prettier" "rustywind"]];
        javascriptreact = [["biome-check" "prettierd" "prettier"]];
        nix = [["alejandra"]];
        golang = ["gofumt" "goimports_reviser" "golines"];
        rust = [["rustfmt"]];
        # yaml = [["prettierd"]];
        json = [["biome-check" "prettierd"]];
        sql = [["sqlfmt"]];
        html = [["biome-check" "prettierd"]];
        css = [["biome-check" "prettierd"]];
        markdown = [["prettierd"]];
        graphql = [["biome-check" "prettierd"]];

        # Use the "*" filetype to run formatters on all filetypes.
        # "*" = ["codespell"];
        # Use the "_" filetype to run formatters on filetypes that don't
        # have other formatters configured.
        "_" = ["trim_whitespace"];
      };
      formatters = {
        "biome-check" = {
          require_cwd = true;
        };
      };
    };
    keymaps = [
      {
        mode = "n";
        key = "<leader>fm";
        options.silent = true;
        options.desc = "format files";
        action =
          #lua
          ''
            function()
              require("conform").format({ lsp_fallback = true })
            end
          '';
      }
      {
        mode = "n";
        key = "<leader>ca";
        action =
          # lua
          "<cmd>lua vim.lsp.buf.code_action()<CR>";
        options.desc = "Code action";
      }
    ];
  };
}
