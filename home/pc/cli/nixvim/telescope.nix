_: {
  programs.nixvim = {
    plugins.telescope = {
      enable = true;
      extensions.ui-select.enable = true;
      extensions.media-files.enable = true;
      extensions.frecency.enable = true;
      settings.defaults = {
        style = "borderless";
        vimgrepArguments = [
          "rg"
          "-L"
          "--color=never"
          "--no-heading"
          "--with-filename"
          "--line-number"
          "--column"
          "--smart-case"
        ];
        promptPrefix = "   ";
        selectionCaret = "  ";
        entryPrefix = "  ";
        initialMode = "insert";
        selectionStrategy = "reset";
        sortingStrategy = "ascending";
        layoutStrategy = "horizontal";
        layoutConfig = {
          horizontal = {
            promptPosition = "top";
            previewWidth = 0.55;
            resultsWidth = 0.8;
          };
          vertical = { mirror = false; };
          width = 0.87;
          height = 0.8;
          previewCutoff = 120;
        };
        fileSorter = ''
          require("telescope.sorters").get_fuzzy_file
        '';
        fileIgnorePatterns = [ "node_modules" ];
        genericSorter = ''
          require("telescope.sorters").get_generic_fuzzy_sorter
        '';
        pathDisplay = [ "truncate" ];
        winblend = 0;
        border = [ ];
        borderchars = [ "─" "│" "─" "│" "╭" "╮" "╯" "╰" ];
        colorDevicons = true;
        setEnv = { COLORTERM = "truecolor"; };
        filePreviewer = ''
          require("telescope.previewers").vim_buffer_cat.new
        '';
        grepPreviewer = ''
          require("telescope.previewers").vim_buffer_vimgrep.new
        '';
        qflistPreviewer = ''
          require("telescope.previewers").vim_buffer_qflist.new
        '';
        bufferPreviewerMaker = ''
          require("telescope.previewers").buffer_previewer_maker
        '';
      };
    };
    keymaps = [
      {
        mode = "n";
        key = "<leader>fw";
        options.silent = true;
        options.desc = "telescope live grep";
        action = "<cmd>Telescope live_grep<CR>";
      }
      {
        mode = "n";
        key = "<leader>fb";
        options.silent = true;
        options.desc = "telescope find buffers";
        action = "<cmd>Telescope buffers<CR>";
      }
      {
        mode = "n";
        key = "<leader>fh";
        options.silent = true;
        options.desc = "telescope help page";
        action = "<cmd>Telescope help_tags<CR>";
      }
      {
        mode = "n";
        key = "<leader>ma";
        options.silent = true;
        options.desc = "telescope find marks";
        action = "<cmd>Telescope marks<CR>";
      }
      {
        mode = "n";
        key = "<leader>fo";
        options.silent = true;
        options.desc = "telescope find oldfiles";
        action = "<cmd>Telescope oldfiles<CR>";
      }
      {
        mode = "n";
        key = "<leader>fz";
        options.silent = true;
        options.desc = "telescope find in current buffer";
        action = "<cmd>Telescope current_buffer_fuzzy_find<CR>";
      }
      {
        mode = "n";
        key = "<leader>cm";
        options.silent = true;
        options.desc = "telescope git commits";
        action = "<cmd>Telescope git_commits<CR>";
      }
      {
        mode = "n";
        key = "<leader>gt";
        options.silent = true;
        options.desc = "telescope git status";
        action = "<cmd>Telescope git_status<CR>";
      }
      {
        mode = "n";
        key = "<leader>pt";
        options.silent = true;
        options.desc = "telescope pick hidden term";
        action = "<cmd>Telescope terms<CR>";
      }
      {
        mode = "n";
        key = "<leader>th";
        options.silent = true;
        options.desc = "telescope nvchad themes";
        action = "<cmd>Telescope themes<CR>";
      }
      {
        mode = "n";
        key = "<leader>ff";
        options.silent = true;
        options.desc = "telescope find files";
        action =
          "<cmd>Telescope find_files follow=true no_ignore=true hidden=true<CR>";
      }
      {
        mode = "n";
        key = "<leader>far";
        action = "<cmd> Telescope lsp_references <CR>";
        options.desc = "Find all references";
      }
      {
        mode = "n";
        key = "<leader>fai";
        action = "<cmd> Telescope lsp_implementations <CR>";
        options.desc = "Find all implementations";
      }
      {
        mode = "n";
        key = "<leader>fad";
        action = "<cmd> Telescope lsp_definitions <CR>";
        options.desc = "Find all definitions";
      }
      {
        mode = "n";
        key = "<leader>fdf";
        action = "<cmd> Telescope dir find_files<CR>";
        options.desc = "Find files in directory";
      }
      {
        mode = "n";
        key = "<leader>fdw";
        action = "<cmd> Telescope dir live_grep<CR>";
        options.desc = "Find words in directory";
      }
    ];
  };
}
