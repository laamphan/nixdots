_: {
  programs.nixvim = {
    plugins.chadtree = {
      enable = true;
    };
    keymaps = [
      {
        mode = "n";
        key = "<C-n>";
        options.silent = true;
        options.desc = "neotree toggle window";
        action = "<cmd>Neotree toggle reveal<CR>";
      }
    ];
  };
}
