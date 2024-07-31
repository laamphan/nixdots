{pkgs, ...}: {
  programs.zsh.enable = true;
  environment = {
    shells = with pkgs; [bash zsh];
    systemPackages = [pkgs.coreutils];
  };
  nix.extraOptions = ''
    experimental-features = nix-command flakes
  '';

  users.users.BinhWSL.home = "/home/BinhWSL";
}
