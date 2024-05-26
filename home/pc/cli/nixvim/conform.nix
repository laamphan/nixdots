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
        javascript = [["/etc/profiles/per-user/$USER/bin/biome" "prettierd" "prettier"]];
        typescript = [["/etc/profiles/per-user/$USER/bin/biome" "prettierd" "prettier"]];
        tsx = [["/etc/profiles/per-user/$USER/bin/biome" "prettierd" "prettier"]];
        jsx = [["/etc/profiles/per-user/$USER/bin/biome" "prettierd" "prettier"]];
        typescriptreact = [["/etc/profiles/per-user/$USER/bin/biome" "prettierd" "prettier" "rustywind"]];
        javascriptreact = [["/etc/profiles/per-user/$USER/bin/biome" "prettierd" "prettier"]];
        nix = [["alejandra"]];
        golang = ["gofumt" "goimports_reviser" "golines"];
        rust = [["rustfmt"]];
        yaml = [["prettierd"]];
        json = [["biome" "prettierd"]];
        sql = [["sqlfmt"]];
        html = [["biome" "prettierd"]];
        css = [["biome" "prettierd"]];
        markdown = [["prettierd"]];

        # Use the "*" filetype to run formatters on all filetypes.
        # "*" = ["codespell"];
        # Use the "_" filetype to run formatters on filetypes that don't
        # have other formatters configured.
        "_" = ["trim_whitespace"];
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
