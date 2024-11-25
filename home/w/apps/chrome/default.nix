{pkgs, ...}: {
  #   programs.google-chrome = {
  #     enable = true;
  #   };

  home.packages = with pkgs; [
    (google-chrome.override {
      commandLineArgs = [
        "--enable-features=UseOzonePlatform,VaapiVideoDecoder"
        "--ozone-platform=wayland"
        "--enable-wayland-ime"
      ];
    })
  ];
}
