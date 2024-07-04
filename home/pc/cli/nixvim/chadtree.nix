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
        options.desc = "chadtree toggle window";
        action = "<cmd>CHADopen<CR>";
      }
    ];
  };
}
