{
  description = "Redyf's NixOS config for desktop and WSL";

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
    hyprland.url = "github:hyprwm/hyprland";
    waybar-hyprland.url = "github:hyprwm/hyprland";
    xdg-portal-hyprland.url = "github:hyprwm/xdg-desktop-portal-hyprland";
    nur.url = "github:nix-community/NUR";
    nix-colors.url = "github:misterio77/nix-colors";
    spicetify-nix.url = "github:the-argus/spicetify-nix";
    Neve.url = "github:redyf/Neve";

    # SFMono w/ patches
    sf-mono-liga-src = {
      url = "github:shaunsingh/SFMono-Nerd-Font-Ligaturized";
      flake = false;
    };

    monolisa = {
      url = "github:redyf/monolisa";
      flake = false;
    };

  };

  outputs =
    { self
    , nixpkgs
    , hyprland
    , home-manager
    , NixOS-WSL
    , spicetify-nix
    , ...
    } @ inputs:
    let
      supportedSystems = [ "x86_64-linux" "x86_64-darwin" "aarch64-linux" "aarch64-darwin" ];

      # Helper function to generate an attrset '{ x86_64-linux = f "x86_64-linux"; ... }'.
      forAllSystems = nixpkgs.lib.genAttrs supportedSystems;

      # Nixpkgs instantiated for supported system types.
      nixpkgsFor = forAllSystems (system: import nixpkgs { inherit system; });
    in
    {
      nixosConfigurations = {
        redyf =
          nixpkgs.lib.nixosSystem
            {
              system = "x86_64-linux";
              specialArgs = {
                inherit
                  inputs
                  hyprland
                  spicetify-nix
                  ;
              };
              modules = [
                ./hosts/redyf/configuration.nix
                home-manager.nixosModules.home-manager
                {
                  home-manager = {
                    useUserPackages = true;
                    useGlobalPkgs = false;
                    extraSpecialArgs = { inherit inputs spicetify-nix; };
                    users.redyf = ./home/desktop/home.nix;
                  };
                }
                hyprland.nixosModules.default
                { programs.hyprland.enable = true; }
              ];
            };
        wsl = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          modules = [
            { nix.registry.nixpkgs.flake = nixpkgs; }
            ./hosts/wsl/configuration.nix
            home-manager.nixosModules.home-manager
            {
              home-manager = {
                useUserPackages = true;
                useGlobalPkgs = false;
                users.red = ./home/wsl/home.nix;
              };
            }
            NixOS-WSL.nixosModules.wsl
          ];
        };
        vm = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          modules = [
            ./hosts/vm/configuration.nix
            home-manager.nixosModules.home-manager
          ];
        };
      };
      devShells = forAllSystems (system:
        let
          pkgs = nixpkgsFor.${system};
        in
        {
          default = pkgs.mkShell {
            buildInputs = with pkgs; [
              git
              nixpkgs-fmt
              statix
            ];
          };
        });
      formatter.x86_64-linux = nixpkgs.legacyPackages.x86_64-linux.nixpkgs-fmt;
    };
}
