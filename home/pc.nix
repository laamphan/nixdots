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

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.

  # Let Home Manager install and manage itself.
  programs = {
    home-manager.enable = true;
  };

  # Imports
  imports = [
    ./shared/apps
    ./shared/cli
    ./shared/cli-apps
    ./shared/desktop
    ./shared/dev
    ./shared/system
    ./shared/tools/git-token
    ./pc/cli
    ./pc/desktop
    ./pc/dev/misc.nix
    ./pc/themes
    ./pc/apps
    ./pc/fcitx5
  ];

  # Allow unfree packages + use overlays
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

  # Add support for .local/bin
  home.sessionPath = [
    "$HOME/.local/bin"
  ];
}
