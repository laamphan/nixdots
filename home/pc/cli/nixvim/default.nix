{ inputs, pkgs, ... }: {
  imports = [
    inputs.nixvim.homeManagerModules.nixvim
    ./cmp.nix
    ./conform.nix
    ./lsp.nix
    ./nvim-tree.nix
    ./rust.nix
    ./telescope.nix
    ./treesitter.nix
    ./which-key.nix
  ];
  programs.nixvim = {
    enable = true;
    extraPlugins = with pkgs.vimPlugins; [ base46 nvchad nvchad-ui ];

    opts = {
      laststatus = 3;
      showmode = false;
      clipboard = "unnamedplus";
      cursorline = true;
      cursorlineopt = "number";
      expandtab = true;
      shiftwidth = 2;
      smartindent = true;
      tabstop = 2;
      softtabstop = 2;
      fillchars = { eob = " "; };
      ignorecase = true;
      smartcase = true;
      mouse = "a";
      number = true;
      relativenumber = true;
      numberwidth = 2;
      ruler = false;
      shortmess = "sI";
      signcolumn = "yes";
      splitbelow = true;
      splitright = true;
      timeoutlen = 400;
      undofile = true;
      updatetime = 250;
      whichwrap = "<>[]hl";
    };

    globals.mapleader = " ";
    globals.togglethemeicon = "   ";

    colorschemes.catppuccin = {
      enable = true;
      settings = {
        disable_underline = true;
        flavour = "mocha";
        integrations = {
          cmp = true;
          gitsigns = true;
          mini = {
            enabled = true;
            indentscope_color = "";
          };
          notify = false;
          nvimtree = true;
          treesitter = true;
        };
        styles = {
          booleans = [ "bold" "italic" ];
          conditionals = [ "bold" ];
        };
        term_colors = true;
      };
    };

    keymaps = [
      {
        mode = "n";
        key = "<C-h>";
        options.silent = true;
        options.desc = "switch window left";
        action = "<C-w>h";
      }
      {
        mode = "n";
        key = "<C-l>";
        options.silent = true;
        options.desc = "switch window right";
        action = "<C-w>l";
      }
      {
        mode = "n";
        key = "<C-j>";
        options.silent = true;
        options.desc = "switch window down";
        action = "<C-w>j";
      }
      {
        mode = "n";
        key = "<C-k>";
        options.silent = true;
        options.desc = "switch window up";
        action = "<C-w>k";
      }
      {
        mode = "i";
        key = "<C-s>";
        options.silent = true;
        options.desc = "Save file & Exit Input Mode";
        action = "<Esc> <C-s> <cmd> w <CR>";
      }
      {
        mode = "n";
        key = "<C-s>";
        options.silent = true;
        options.desc = "file save";
        action = "<cmd>w<CR>";
      }
      {
        mode = "n";
        key = "<leader>ra";
        action =
          #Lua
          ''
            function()
              require "nvchad-ui.lsp.renamer"()
            end
          '';
        options.desc = "NvRenamer";
      }

    ];

    plugins = {
      indent-blankline.enable = true;
      nvim-colorizer = {
        enable = true;
        userDefaultOptions.tailwind = true;
      };
      comment.enable = true;
      gitsigns.enable = true;
      telescope.enable = true;
      treesitter.enable = true;
      luasnip.enable = true;
      lualine.enable = true;
      nvim-autopairs.enable = true;
    };
  };
}
