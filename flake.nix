{
  description = "laamphan's flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";

    NixOS-WSL = {
      url = "github:nix-community/NixOS-WSL";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Hyprland ecosystem
    hyprland.url = "git+https://github.com/hyprwm/Hyprland?submodules=1&rev=a425fbebe4cf4238e48a42f724ef2208959d66cf";
    waybar-hyprland.url = "github:Alexays/Waybar";
    xdg-portal-hyprland.url = "github:hyprwm/xdg-desktop-portal-hyprland?ref=v1.3.7";

    # Utilities and themes
    nur.url = "github:nix-community/NUR";
    nix-colors.url = "github:misterio77/nix-colors";
    catppuccin.url = "github:catppuccin/nix";
    spicetify-nix.url = "github:Gerg-L/spicetify-nix";

    # Development tools
    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    alejandra = {
      url = "github:kamadorueda/alejandra/3.0.0";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Browser extensions
    firefox-addons = {
      url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # macOS support
    darwin = {
      url = "github:lnl7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs:
    with inputs; let
      # Constants
      users = {
        mac = "lap16096";
        pc = "w";
        wsl = "BinhWSL";
      };

      # Shared configuration
      secrets = builtins.fromJSON (builtins.readFile "${self}/secrets.json");

      hyprutils = nixpkgs.pkgs.callPackage (nixpkgs.fetchFromGitHub {
        owner = "hyprwm";
        repo = "hyprutils";
        rev = "v0.2.6";
        sha256 = "19alkrkhy5v7bhsf3vpp07nwh7f67lh4glaciir9lgrzcq21na5f";
      }) {};

      # Helper function for home-manager defaults
      mkHomeManagerDefaults = specialArgs: {
        home-manager = {
          useGlobalPkgs = false;
          useUserPackages = true;
          backupFileExtension = "hm-backup";
          extraSpecialArgs = specialArgs;
        };
      };

      # Helper function for creating special args
      mkSpecialArgs = username: extraArgs:
        {
          inherit inputs username secrets;
        }
        // extraArgs;
    in {
      # Formatters
      formatter.x86_64-linux = nixpkgs.legacyPackages.x86_64-linux.alejandra;

      # macOS configurations
      darwinPackages = self.darwinConfigurations."HX-VT-WS-A029".pkgs;

      darwinConfigurations.binh-mbp = let
        specialArgs = mkSpecialArgs users.mac {};
      in
        darwin.lib.darwinSystem {
          system = "aarch64-darwin";
          pkgs = import nixpkgs {system = "aarch64-darwin";};
          inherit specialArgs;
          modules = [
            ./hosts/mac-arm
            home-manager.darwinModules.home-manager
            (mkHomeManagerDefaults specialArgs)
          ];
        };

      # NixOS configurations
      nixosConfigurations = {
        # Main PC configuration
        w = let
          specialArgs = mkSpecialArgs users.pc {inherit spicetify-nix;};
        in
          nixpkgs.lib.nixosSystem {
            system = "x86_64-linux";
            inherit specialArgs;
            modules = [
              ./hosts/w/configuration.nix
              home-manager.nixosModules.home-manager
              (mkHomeManagerDefaults specialArgs)
              hyprland.nixosModules.default
              {programs.hyprland.enable = true;}
            ];
          };

        # WSL configuration
        binh-wsl = let
          specialArgs = mkSpecialArgs users.wsl {};
        in
          nixpkgs.lib.nixosSystem {
            system = "x86_64-linux";
            inherit specialArgs;
            modules = [
              NixOS-WSL.nixosModules.wsl
              ./hosts/wsl/default.nix
              home-manager.nixosModules.home-manager
              (mkHomeManagerDefaults specialArgs)
            ];
          };
      };
    };
}
