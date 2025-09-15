{
  inputs,
  pkgs,
  ...
}: {
  imports = [inputs.catppuccin.homeModules.catppuccin];

  gtk = {
    enable = true;

    cursorTheme = {
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Ice";
    };
  };

  # catppuccin.gtk = {
  #   enable = true;
  #   flavor = "mocha";
  #   accent = "blue";
  #   size = "compact";
  #   tweaks = ["rimless"];
  # };
}
