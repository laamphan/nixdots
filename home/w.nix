{
  pkgs,
  inputs,
  username,
  ...
}: {
  home = {
    username = username;
    homeDirectory = "/home/${username}";
    stateVersion = "22.11";
  };

  programs.home-manager.enable = true;

  imports = [
    ./shared/apps
    ./shared/cli
    ./shared/cli-apps
    ./shared/desktop
    ./shared/dev
    ./shared/system
    ./shared/tools/git-token
    ./w/cli
    ./w/desktop
    ./w/dev/misc.nix
    ./w/themes
    ./w/apps
    ./w/fcitx5
  ];

  nixpkgs = {
    config = {
      allowUnfree = true;
    };
    overlays = [
      # (import ../../overlays/firefox-overlay.nix)
      # inputs.neovim-nightly-overlay.overlay
    ];
  };

  fonts.fontconfig.enable = true;

  # xdg.configFile."nvim/" = {
  #   source = pkgs.callPackage ../packages/nvchad {};
  # };

  home.sessionPath = [
    "$HOME/.local/bin"
  ];
}
