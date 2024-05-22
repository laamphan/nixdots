{
  pkgs,
  inputs,
  ...
}: {
  nixpkgs = {
    config = {
      allowUnfree = true;
    };
    overlays = [
      inputs.neovim-nightly-overlay.overlay
    ];
  };

  home.stateVersion = "22.11";
  home.packages = with pkgs; [
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
  home.file.".inputrc".source = ./mac-arm/dotfiles/inputrc;

  xdg.configFile."nvim/" = {
    source = pkgs.callPackage ../packages/nvchad {};
  };

  imports = [
    ./mac-arm/utils
    ./mac-arm/window-managers
    ./shared/apps
    ./shared/cli
    ./shared/cli-apps
    ./shared/desktop
    ./shared/dev
    ./shared/tools
    ./shared/system
  ];
}
