{username, ...}: {
  home = {
    username = "${username}";
    homeDirectory = "/home/${username}";
    sessionVariables.EDITOR = "nvim";
    sessionVariables.SHELL = "/etc/profiles/per-user/${username}/bin/zsh";
  };

  programs.home-manager.enable = true;

  imports = [
    ./shared/cli
    ./shared/cli-apps
    ./shared/dev
    ./shared/system
    ./shared/tools/git-token
    ./w/cli
    ./w/themes
  ];

  nixpkgs = {
    config = {
      allowUnfree = true;
    };
    overlays = [
      # (import ../../overlays/firefox-overlay.nix)
    ];
  };

  fonts.fontconfig.enable = true;

  # xdg.configFile."nvim/" = {
  #   source = pkgs.callPackage ../packages/nvchad {};
  # };

  home.sessionPath = ["$HOME/.local/bin"];
}
