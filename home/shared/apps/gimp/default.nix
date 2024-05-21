{pkgs, ...}: {
  home.packages = with pkgs; [
    gimp
    # gimp-with-plugins
    # gimpPlugins.resynthesizer
  ];
}
