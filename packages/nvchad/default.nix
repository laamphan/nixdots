{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  ...
}: let
  custom = ./custom;
in
  stdenvNoCC.mkDerivation rec {
    name = "nvchad";
    version = "2.0";

    src = fetchFromGitHub {
      owner = "NvChad";
      repo = "NvChad";
      rev = "refs/heads/v${version}";
      sha256 = "3gH3VIXKeWDlFowfsxffRcjOa7Yjoy+COfX0sVNDc24=";
    };

    preferLocalBuild = true;

    # remember to rm -rf .config/nvim .local/share/nvim .cache/nvim when reinstalling on mac
    installPhase = ''
      mkdir -p $out
      cp -r ./ $out
      mkdir -p "$out/lua/custom"
      cp -r ${custom}/* "$out/lua/custom/"
    '';

    meta = with lib; {
      description = "NvChad";
      homepage = "https://github.com/NvChad/NvChad";
      platforms = platforms.all;
      license = licenses.gpl3;
    };
  }
