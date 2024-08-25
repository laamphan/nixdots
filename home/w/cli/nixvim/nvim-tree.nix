_: {
  programs.nixvim = {
    plugins.nvim-tree = {
      enable = true;
      filters = { dotfiles = false; };
      disableNetrw = true;
      hijackNetrw = true;
      hijackCursor = true;
      hijackUnnamedBufferWhenOpening = false;
      syncRootWithCwd = true;
      updateFocusedFile = {
        enable = true;
        updateRoot = false;
      };
      view = {
        side = "left";
        width = 30;
        preserveWindowProportions = true;
      };
      git = {
        enable = true;
        ignore = true;
      };
      filesystemWatchers = { enable = true; };
      actions = { openFile = { resizeWindow = true; }; };
      renderer = {
        rootFolderLabel = false;
        highlightGit = true;
        highlightOpenedFiles = "none";

        indentMarkers = { enable = true; };

        icons = {
          show = {
            file = true;
            folder = true;
            folderArrow = true;
            git = true;
          };

          glyphs = {
            default = "󰈚";
            symlink = "";
            folder = {
              default = "";
              empty = "";
              emptyOpen = "";
              open = "";
              symlink = "";
              symlinkOpen = "";
              arrowOpen = "";
              arrowClosed = "";
            };
            git = {
              unstaged = "✗";
              staged = "✓";
              unmerged = "";
              renamed = "➜";
              untracked = "★";
              deleted = "";
              ignored = "◌";
            };
          };
        };
      };
    };
    keymaps = [
      {
        mode = "n";
        key = "<C-n>";
        options.silent = true;
        options.desc = "nvimtree toggle window";
        action = "<cmd>NvimTreeToggle<CR>";
      }
      {
        mode = "n";
        key = "<leader>e";
        options.silent = true;
        options.desc = "nvimtree focus window";
        action = "<cmd>NvimTreeFocus<CR>";
      }
    ];
  };
}
