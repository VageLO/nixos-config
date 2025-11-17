{
  description = "NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    bsparse = {
      url = "github:VageLO/bsparse";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    bsmmex = {
      url = "github:VageLO/bsmmex";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {self, nixpkgs, ...}@inputs:
    let
      inherit (self) outputs;
      system = "x86_64-linux";

      pkgs = import nixpkgs {
        config = { allowUnfree = true; };
        overlays = [
          (final: prev: {
            bsparse = inputs.bsparse.packages.${system}.default;
            bsmmex = inputs.bsmmex.packages.${system}.default;
          })
        ];
        inherit system;
      };
    in {

      nixosConfigurations = {
        nixos = nixpkgs.lib.nixosSystem {
          specialArgs = {
            inherit inputs outputs;
            inherit pkgs;
          };
          modules = [
            ./hosts/laptop/configuration.nix
            inputs.home-manager.nixosModules.home-manager
            {
              home-manager.extraSpecialArgs = { inherit inputs; };
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.users.vagelo = import ./hosts/laptop/home.nix;
            }
          ];
        };
      };

      homeConfigurations = {
        "vagelo@lp" = inputs.home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          extraSpecialArgs = { inherit inputs outputs; };
          modules = [ ./hosts/laptop/home.nix ];
        };
      };
    };
}
