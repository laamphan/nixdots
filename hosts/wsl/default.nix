{pkgs, ...}: {
  users = {
    users = {
      BinhWSL = {
        isNormalUser = true;
        description = "binh1298";
        initialPassword = "123123";
        shell = pkgs.zsh;
        extraGroups = ["networkmanager" "wheel" "input" "docker" "libvirtd"];
      };
    };
  };

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
