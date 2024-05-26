_: {
  programs.nixvim = {
    plugins = {
      lsp = {
        enable = true;
        servers = {
          tsserver = {
            enable = true;
            extraOptions = {
              preferences = {
                importModuleSpecifierPreference = "non-relative";
              };
            };
            settings = {
              preferences = {
                importModuleSpecifierPreference = "non-relative";
              };
            };
          };
          gopls = {
            enable = true;
            cmd = [ "gopls" ];
            filetypes = [ "go" "gomod" "gowork" "gotmpl" ];
            rootDir = ''
              require("lspconfig").util.root_pattern("go.work", "go.mod", ".git")'';
            settings = {
              gopls = {
                completeUnimported = true;
                analyses = {
                  unusedparams = true;
                  shadow = true;
                };
              };
            };
          };
          lua-ls.enable = true;
          biome.enable = true;
          tailwindcss.enable = true;
          eslint.enable = true;
          astro.enable = true;
          html.enable = true;
          cssls.enable = true;
          bashls.enable = true;
          yamlls.enable = true;
          nil_ls.enable = true;
        };
      };
    };
  };
}
