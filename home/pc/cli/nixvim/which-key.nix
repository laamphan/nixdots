_: {
  programs.nixvim = {
    plugins = { which-key.enable = true; };
    keymaps = [
      {
        mode = "n";
        key = "<leader>wK";
        options.silent = true;
        options.desc = "which-key";
        action = "<cmd>WhichKey <CR>";
      }
      {
        mode = "n";
        key = "<leader>wk";
        action =
          #lua 
          ''
            function()
              vim.cmd("WhichKey " .. vim.fn.input "WhichKey: ")
            end,
          '';
        options.desc = "whichkey query lookup";
      }

    ];
  };
}
