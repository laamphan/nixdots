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
    zip

    cmatrix
    onefetch

    # Screenshot + extra utils
    ffmpeg_6 # A complete, cross-platform solution to record, convert and stream audio and video
    scrcpy
    android-tools

    # Gaming
    # gnutls
    # minecraft
    # grapejuice
    # libpulseaudio
  ];
}
