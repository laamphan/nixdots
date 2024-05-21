{pkgs, ...}: {
  home.packages = with pkgs; [
    # System Utils
    mpd
    mpv
    tree
    xclip
    unzip # Unzip files using the terminal
    nerdfix # Fix obsolete nerd font icons
    tree-sitter # A parser generator tool and an incremental parsing library
    appimage-run # Run appimage files in the terminal
    polkit_gnome
    networkmanager
    zip

    polkit
    cmatrix
    onefetch
    nitrogen # Wallpaper utility for X11

    # Screenshot + extra utils
    ffmpeg_6 # A complete, cross-platform solution to record, convert and stream audio and video

    # Gaming
    # gnutls
    # minecraft
    # grapejuice
    # libpulseaudio
  ];
}
