{
  description = "binh1298's NixOS config for desktop and WSL";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    NixOS-WSL = {
      url = "github:nix-community/NixOS-WSL";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprland.url = "git+https://github.com/hyprwm/Hyprland?submodules=1";
    waybar-hyprland.url = "github:Alexays/Waybar";
    xdg-portal-hyprland.url = "github:hyprwm/xdg-desktop-portal-hyprland";

    nur.url = "github:nix-community/NUR";
    nix-colors.url = "github:misterio77/nix-colors";
    spicetify-nix.url = "github:the-argus/spicetify-nix";
    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    alejandra.url = "github:kamadorueda/alejandra/3.0.0";
    alejandra.inputs.nixpkgs.follows = "nixpkgs";

    firefox-addons = {
      url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    darwin.url = "github:lnl7/nix-darwin";
    darwin.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = {
    self,
    nixpkgs,
    hyprland,
    home-manager,
    NixOS-WSL,
    spicetify-nix,
    alejandra,
    darwin,
    ...
  } @ inputs: {
    darwinConfigurations = {
      binh-mbp = darwin.lib.darwinSystem {
        system = "aarch64-darwin";
        pkgs = import nixpkgs {system = "aarch64-darwin";};
        specialArgs = {inherit inputs;};
        modules = [
          ./hosts/mac-arm
          home-manager.darwinModules.home-manager
          {
            home-manager = {
              useGlobalPkgs = false;
              useUserPackages = true;
              extraSpecialArgs = {inherit inputs;};
              users.lap16096.imports = [./home/mac.nix];
              backupFileExtension = "backup";
            };
          }
        ];
      };
    };
    nixosConfigurations = {
      binh-pc = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = {inherit inputs hyprland spicetify-nix;};
        modules = [
          {
            environment.systemPackages = [alejandra.defaultPackage."x86_64-linux"];
          }
          ./hosts/binh1298/configuration.nix
          home-manager.nixosModules.home-manager
          {
            home-manager = {
              useGlobalPkgs = false;
              useUserPackages = true;
              extraSpecialArgs = {inherit inputs spicetify-nix;};
              users.binh1298 = ./home/pc.nix;
            };
          }
          hyprland.nixosModules.default
          {programs.hyprland.enable = true;}
        ];
      };
    };
    formatter.x86_64-linux = nixpkgs.legacyPackages.x86_64-linux.nixpkgs-fmt;
    darwinPackages = self.darwinConfigurations."HX-VT-WS-A029".pkgs;
  };
}
