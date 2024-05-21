{pkgs, ...}: {
  home.stateVersion = "22.11";
  home.packages = with pkgs; [
    ripgrep
    fd
    curl
    less
  ];
  home.sessionVariables = {
    PAGER = "less";
    CLICLOLOR = "1";
    EDITOR = "nvim";
  };

  programs.bat.enable = true;
  programs.bat.config.theme = "TwoDark";
  programs.fzf.enable = true;
  programs.fzf.enableZshIntegration = true;
  programs.eza.enable = true;
  programs.git.enable = true;
  programs.zsh.enable = true;
  programs.zsh.enableCompletion = true;
  programs.zsh.autosuggestion.enable = true;
  programs.zsh.syntaxHighlighting.enable = true;
  programs.zsh.shellAliases = {
    ls = "ls --color=auto -F";
  };
  programs.starship.enable = true;
  programs.starship.enableZshIntegration = true;

  home.file.".inputrc".source = ./dotfiles/inputrc;

  xdg.configFile."nvim/" = {
    source = pkgs.callPackage ../packages/nvchad {};
  };

  imports = [
    ./mac-arm/utils
    ./mac-arm/window-managers
    ./shared/dev
    ./shared/cli-apps
    ./shared/desktop
  ];
}
