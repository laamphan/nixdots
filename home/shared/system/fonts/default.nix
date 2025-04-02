{pkgs, ...}: {
  home.packages = with pkgs; [
    noto-fonts
    noto-fonts-extra
    noto-fonts-cjk-sans
    noto-fonts-cjk-serif
    noto-fonts-color-emoji
    dejavu_fonts
    font-awesome
    fira-code-symbols
    powerline-symbols
    material-design-icons
    commit-mono
    # pkgs.nerd-fonts.ibm-plex-mono
    # pkgs.nerd-fonts.cascadia-code
    pkgs.nerd-fonts.fira-code
    pkgs.nerd-fonts.fira-mono
    pkgs.nerd-fonts.jetbrains-mono
    pkgs.nerd-fonts.ubuntu
    pkgs.helvetica-neue-lt-std
  ];
}
