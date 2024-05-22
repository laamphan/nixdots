{pkgs, ...}: {
  home.file.".config/chrome-flags.conf" = {
    force = true;
    text = ''
      --enable-features=UseOzonePlatform
      --ozone-platform=wayland
      --enable-wayland-ime
    '';
  };

  programs.google-chrome = {
    enable = true;
  };
}
