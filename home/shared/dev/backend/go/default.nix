{pkgs, ...}: {
  home.packages = with pkgs; [
    go # Go programming language
    gopls
    gofumpt
    goimports-reviser
    golines
    gomodifytags
    gotests
    impl
    iferr
    air
  ];
}
