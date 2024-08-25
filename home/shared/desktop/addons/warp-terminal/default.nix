{pkgs, ...}: {
  home.packages = with pkgs; [warp-terminal];
  home.file.".warp/themes/catppucin.yml" = {
    force = true;
    text = import ./catppucin.nix;
  };
}
