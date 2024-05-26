_: {
  programs.nixvim = {
    plugins = { barbar.enable = true; };
    keymaps = [
      {
        mode = "n";
        key = "<S-Tab>";
        action = "<Cmd>BufferPrevious<CR>";
        options = {
          silent = true;
          desc = "Go to previous buffer";
        };
      }
      {
        mode = "n";
        key = "<Tab>";
        action = "<Cmd>BufferNext<CR>";
        options = {
          silent = true;
          desc = "Go to next buffer";
        };
      }
      # Re-order to previous/next
      {
        mode = "n";
        key = "C-<PageUp>";
        action = "<Cmd>BufferPrevious<CR>";
        options = {
          silent = true;
          desc = "Go to previous buffer";
        };
      }
      {
        mode = "n";
        key = "C-<PageDown>";
        action = "<Cmd>BufferNext<CR>";
        options = {
          silent = true;
          desc = "Go to next buffer";
        };
      }
      # Goto buffer in position...
      {
        mode = "n";
        key = "<C-1>";
        action = "<Cmd>BufferGoto 1<CR>";
        options = {
          silent = true;
          desc = "Go to buffer in position 1";
        };
      }
      {
        mode = "n";
        key = "<C-2>";
        action = "<Cmd>BufferGoto 2<CR>";
        options = {
          silent = true;
          desc = "Go to buffer in position 2";
        };
      }
      {
        mode = "n";
        key = "<C-3>";
        action = "<Cmd>BufferGoto 3<CR>";
        options = {
          silent = true;
          desc = "Go to buffer in position 3";
        };
      }
      {
        mode = "n";
        key = "<C-4>";
        action = "<Cmd>BufferGoto 4<CR>";
        options = {
          silent = true;
          desc = "Go to buffer in position 4";
        };
      }
      {
        mode = "n";
        key = "<C-5>";
        action = "<Cmd>BufferGoto 5<CR>";
        options = {
          silent = true;
          desc = "Go to buffer in position 5";
        };
      }
      {
        mode = "n";
        key = "<C-6>";
        action = "<Cmd>BufferGoto 6<CR>";
        options = {
          silent = true;
          desc = "Go to buffer in position 6";
        };
      }
      {
        mode = "n";
        key = "<C-7>";
        action = "<Cmd>BufferGoto 7<CR>";
        options = {
          silent = true;
          desc = "Go to buffer in position 7";
        };
      }
      {
        mode = "n";
        key = "<C-8>";
        action = "<Cmd>BufferGoto 8<CR>";
        options = {
          silent = true;
          desc = "Go to buffer in position 8";
        };
      }
      {
        mode = "n";
        key = "<C-9>";
        action = "<Cmd>BufferGoto 9<CR>";
        options = {
          silent = true;
          desc = "Go to buffer in position 9";
        };
      }
      {
        mode = "n";
        key = "<C-0>";
        action = "<Cmd>BufferLast<CR>";
        options = {
          silent = true;
          desc = "Go to last buffer";
        };
      }
      # Close buffer
      {
        mode = "n";
        key = "<leader>x";
        action = "<Cmd>BufferClose<CR>";
        options = {
          silent = true;
          desc = "Close buffer";
        };
      }
      # Restore buffer
      {
        mode = "n";
        key = "<leader>X";
        action = "<Cmd>BufferRestore<CR>";
        options = {
          silent = true;
          desc = "Restore buffer";
        };
      }
    ];
  };
}
