
{pkgs, ...}: {
  home.file.".config/fcitx5/conf/classicui.conf" = {
    force = true;
    text = ''
      Theme=Nord-Dark
    '';
  };
}
