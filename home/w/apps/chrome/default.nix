{pkgs, ...}: {
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
