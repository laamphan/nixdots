{pkgs, ...}: {
  programs.zsh.enable = true;
  environment = {
    shells = with pkgs; [bash zsh];
    loginShell = pkgs.zsh;
    systemPackages = [pkgs.coreutils];
    systemPath = ["opt/homebrew/bin"];
    pathsToLink = ["/Applications"];
  };
  nix.extraOptions = ''
    experimental-features = nix-command flakes
  '';

  system.keyboard.enableKeyMapping = true;
  system.keyboard.remapCapsLockToEscape = true;

  font.fontDir.enable = true;
  fonts.fonts = [(pkgs.nerdfonts.override {fonts = ["Meslo"];})];
  services.nix-daemon.enable = true;

  system.defaults = {
    finder.AppleShowAllExtensions = true;
    finder._FXShoPosixPathInTitle = true;
    dock.autohide = false;
    NSGlobalDomain.AppleShowAllExtensions = true;
    NSGLobalDomain.InitialKeyRepeat = 14;
    NSGLobalDomain.KeyRepeat = 1;
  }

  # backwards compat; don't change
  system.stateVersion = 4;
  homebrew = {
    enable = true;
    caskArgs.no_quarantine = true;
    global.brewfile = true;
    masApp = {};
    casks= ["raycast" "amethyst"];
    taps = ["fujiapple852/trippy"];
    brews = ["trippy"];
  };
}
