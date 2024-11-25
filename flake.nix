{
  description = "binh1298's NixOS config for desktop and WSL";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-24.11-darwin";
    NixOS-WSL = {
      url = "github:nix-community/NixOS-WSL";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager?ref=release-24.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprutils = {
      url = "github:hyprwm/hyprutils?ref=v0.2.6"; # Use the v0.2.6 tag (or a specific commit hash if needed)
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hyprland.url = "git+https://github.com/hyprwm/Hyprland?submodules=1&ref=nix";
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
  };

  outputs = inputs:
    with inputs; let
      hyprutils = nixpkgs.pkgs.callPackage (nixpkgs.fetchFromGitHub {
        owner = "hyprwm";
        repo = "hyprutils";
        rev = "v0.2.6";
        sha256 = "19alkrkhy5v7bhsf3vpp07nwh7f67lh4glaciir9lgrzcq21na5f";
      }) {};

      hyprlandWithHyprutils = hyprland.overrideAttrs (oldAttrs: {
        buildInputs = oldAttrs.buildInputs ++ [hyprutils];
        pkgConfig =
          oldAttrs.pkgConfig
          // {
            PKG_CONFIG_PATH = "${hyprutils}/lib/pkgconfig";
          };
      });

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
          specialArgs = {inherit inputs username secrets;};
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
