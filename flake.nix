{
  description = "laamphan's flake";

  # TODO add cuda cache source https://www.youtube.com/watch?v=5T52jNXzqIU
  # https://app.cachix.org/cache/cuda-maintainers

  nixConfig = {
    extra-substituters = [
      "https://cuda-maintainers.cachix.org"
    ];
    extra-trusted-public-keys = [
      "cuda-maintainers.cachix.org-1:0dq3bujKpuEPMCX6U4WylrUDZ9JyUG0VpVZa7CNfq5E="
    ];
  };

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    NixOS-WSL = {
      url = "github:nix-community/NixOS-WSL";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprland.url = "git+https://github.com/hyprwm/Hyprland?submodules=1&rev=a425fbebe4cf4238e48a42f724ef2208959d66cf";
    waybar-hyprland.url = "github:Alexays/Waybar";
    xdg-portal-hyprland.url = "github:hyprwm/xdg-desktop-portal-hyprland?ref=v1.3.7";

    nur.url = "github:nix-community/NUR";
    nix-colors.url = "github:misterio77/nix-colors";
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
    spicetify-nix.url = "github:Gerg-L/spicetify-nix";
    catppuccin.url = "github:catppuccin/nix";
  };

  outputs = inputs:
    with inputs; let
      hyprutils = nixpkgs.pkgs.callPackage (nixpkgs.fetchFromGitHub {
        owner = "hyprwm";
        repo = "hyprutils";
        rev = "v0.2.6";
        sha256 = "19alkrkhy5v7bhsf3vpp07nwh7f67lh4glaciir9lgrzcq21na5f";
      }) {};

      secrets = builtins.fromJSON (builtins.readFile "${self}/secrets.json");

      homeManagerDefaults = specialArgs: {
        home-manager.useGlobalPkgs = false;
        home-manager.useUserPackages = true;
        home-manager.backupFileExtension = "hm-backup";
        home-manager.extraSpecialArgs = specialArgs;
      };

      macUserName = "lap16096";
      pcUserName = "w";
      wslUserName = "BinhWSL";
    in {
      formatter.x86_64-linux = nixpkgs.legacyPackages.x86_64-linux.alejandra;
      darwinPackages = self.darwinConfigurations."HX-VT-WS-A029".pkgs;
      darwinConfigurations = let
        username = macUserName;
        specialArgs = {inherit inputs username secrets;};
      in {
        binh-mbp = darwin.lib.darwinSystem {
          system = "aarch64-darwin";
          specialArgs = specialArgs;
          pkgs = import nixpkgs {system = "aarch64-darwin";};
          modules = [
            ./hosts/mac-arm
            home-manager.darwinModules.home-manager
            (homeManagerDefaults specialArgs)
          ];
        };
      };
      nixosConfigurations = {
        w = let
          username = pcUserName;
          specialArgs = {inherit inputs username secrets spicetify-nix;};
        in
          nixpkgs.lib.nixosSystem {
            system = "x86_64-linux";
            specialArgs = specialArgs;
            modules = [
              ./hosts/w/configuration.nix
              home-manager.nixosModules.home-manager
              (homeManagerDefaults specialArgs)
              hyprland.nixosModules.default
              {programs.hyprland.enable = true;}
            ];
          };
        binh-wsl = let
          username = wslUserName;
          specialArgs = {inherit inputs username secrets;};
        in
          nixpkgs.lib.nixosSystem {
            system = "x86_64-linux";
            specialArgs = specialArgs;
            modules = [
              NixOS-WSL.nixosModules.wsl
              ./hosts/wsl/default.nix
              home-manager.nixosModules.home-manager
              (homeManagerDefaults specialArgs)
            ];
          };
      };
    };
}
