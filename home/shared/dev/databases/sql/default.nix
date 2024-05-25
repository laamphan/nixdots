{pkgs, ...}: {
  home.packages = with pkgs; [
    postgresql
    dbeaver-bin
    # beekeeper-studio
    # mysql-workbench
  ];
}
